package com.toy.library.api.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.toy.library.api.model.vo.Library;
import com.toy.library.common.model.vo.PageInfo;
import com.toy.library.common.template.Pagination;

@Controller
@RequestMapping("/list")
public class LibraryApiController {
    
	@RequestMapping("api")
	public String api() {
		return "api/libraryList";
	}
	
    private static final String SERVICE_KEY = "서비스키";  // 하드코딩된 서비스 키
	
    @GetMapping
    public String getLibraryList(@RequestParam(defaultValue = "1") int page, Model model) {
        int totalCount = 1523;  // 총 데이터 수
        int boardLimit = 20;    // 한 페이지에 보여줄 데이터 개수 (한 페이지에 20개 도서관 정보)
        int pageLimit = 5;      // 페이지네이션에 표시할 페이지 개수 (최대 5개 페이지 번호)

        // Pagination 클래스에서 PageInfo 객체 생성
        PageInfo pageInfo = Pagination.getPageInfo(totalCount, page, boardLimit, pageLimit);

        // 페이지의 시작 인덱스와 끝 인덱스 계산
        int start = (page - 1) * boardLimit + 1;  // 시작 인덱스 (1부터 시작)
        int end = Math.min(start + boardLimit - 1, totalCount);  // 끝 인덱스 (총 데이터 수를 초과하지 않게)

        // API 호출 및 데이터 처리 로직
        List<Library> libraries = getLibraries(start, end);

        // 모델에 페이징 정보 추가
        model.addAttribute("libraries", libraries);
        model.addAttribute("pageInfo", pageInfo);

        return "api/libraryList";  // JSP 경로
    }

    // 서울시 OpenAPI 호출 후 데이터를 처리하여 반환하는 메서드
    private List<Library> getLibraries(int start, int end) {
        List<Library> libraryList = new ArrayList<Library>();

        try {
            String url = String.format("http://openapi.seoul.go.kr:8088/%s/xml/SeoulLibraryTimeInfo/%d/%d/",
                    SERVICE_KEY, start, end);

            // HttpURLConnection을 사용하여 API 요청
            HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setRequestMethod("GET");

            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;

            // API 응답 읽기
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();

            // API 응답에서 XML 데이터를 파싱하여 도서관 목록 추출
            String xmlResponse = response.toString();
            Document document = Jsoup.parse(xmlResponse, "", org.jsoup.parser.Parser.xmlParser());
            Elements rows = document.select("row");

            // 각 도서관 데이터를 Library 객체에 넣어서 리스트에 추가
            for (org.jsoup.nodes.Element row : rows) {
                Library library = new Library();
                library.setLbrrySeqNo(row.select("LBRRY_SEQ_NO").text());
                library.setLbrryName(row.select("LBRRY_NAME").text());
                library.setCodeValue(row.select("CODE_VALUE").text()); // 'GU_NAME'으로 구명 정보를 가져옴
                library.setAdres(row.select("ADRES").text());
                library.setCloseDate(row.select("FDRM_CLOSE_DATE").text());
                library.setTelNo(row.select("TEL_NO").text());
                library.setXcnts(row.select("XCNTS").text());
                library.setYdnts(row.select("YDNTS").text());

                libraryList.add(library);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return libraryList;
    }
}
