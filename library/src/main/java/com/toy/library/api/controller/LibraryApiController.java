package com.toy.library.api.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.toy.library.api.model.vo.Library;
import com.toy.library.common.model.vo.PageInfo;
import com.toy.library.common.template.Pagination;

@Controller
@RequestMapping("/list")
public class LibraryApiController {
    
    private static final String SERVICE_KEY = "서비스키";
    
    @GetMapping
    public String getLibraryList(@RequestParam(defaultValue = "1") int page, Model model) {
        int totalCount = 1523;
        int boardLimit = 20;
        int pageLimit = 5;

        PageInfo pageInfo = Pagination.getPageInfo(totalCount, page, boardLimit, pageLimit);

        int start = (page - 1) * boardLimit + 1;
        int end = Math.min(start + boardLimit - 1, totalCount);

        List<Library> libraries = getLibraries(start, end);

        model.addAttribute("libraries", libraries);
        model.addAttribute("pageInfo", pageInfo);

        return "api/libraryList";
    }

    private List<Library> getLibraries(int start, int end) {
        List<Library> libraryList = new ArrayList<Library>();

        try {
            String url = String.format("http://openapi.seoul.go.kr:8088/%s/json/SeoulLibraryTimeInfo/%d/%d/",
                    SERVICE_KEY, start, end);

            HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setRequestMethod("GET");

            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;

            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();

            String jsonResponse = response.toString();
            
            Gson gson = new Gson();
            JsonObject rootNode = gson.fromJson(jsonResponse, JsonObject.class);
            JsonObject seoulLibraryTimeInfo = rootNode.getAsJsonObject("SeoulLibraryTimeInfo");
            JsonArray rowsNode = seoulLibraryTimeInfo.getAsJsonArray("row");

            for (JsonElement rowElement : rowsNode) {
                JsonObject row = rowElement.getAsJsonObject();
                
                Library library = new Library();
                library.setLbrrySeqNo(row.get("LBRRY_SEQ_NO").getAsString());
                library.setLbrryName(row.get("LBRRY_NAME").getAsString());
                library.setCodeValue(row.get("CODE_VALUE").getAsString()); // 구명
                library.setAdres(row.get("ADRES").getAsString());
                library.setCloseDate(row.get("FDRM_CLOSE_DATE").getAsString());
                library.setTelNo(row.get("TEL_NO").getAsString());
                library.setXcnts(row.get("XCNTS").getAsString());
                library.setYdnts(row.get("YDNTS").getAsString());

                libraryList.add(library);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return libraryList;
    }
}
