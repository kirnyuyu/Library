package com.toy.library.api.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor

public class Library {

	private String lbrrySeqNo;	// 도서관 일련번호 (시퀀스)
	private String lbrryName;	// 도서관명
	private String guCode;		// 구 코드
	private String codeValue;	// 구명
	private String adres;		// 주소
	private String closeDate;	// 휴관일
	private String telNo;		// 전화번호
	private String xcnts;		// 위도
	private String ydnts;		// 경도

}
