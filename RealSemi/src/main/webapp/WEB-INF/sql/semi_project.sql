/* 지점추가이미지 */
CREATE TABLE STOREDETIALIMAGE (
	storeDetailImageId NUMBER NOT NULL, /* 지점추가이미지id */
	fk_storeId NUMBER, /* 지점id */
	imageFile NVARCHAR2(255), /* 이미지파일 */
	position CHAR(2) /* 순서 */
);

COMMENT ON TABLE STOREDETIALIMAGE IS '지점추가이미지';

COMMENT ON COLUMN STOREDETIALIMAGE.storeDetailImageId IS '지점추가이미지id';

COMMENT ON COLUMN STOREDETIALIMAGE.fk_storeId IS '지점id';

COMMENT ON COLUMN STOREDETIALIMAGE.imageFile IS '이미지파일';

COMMENT ON COLUMN STOREDETIALIMAGE.position IS '순서';

CREATE UNIQUE INDEX PK_STOREDETIALIMAGE
	ON STOREDETIALIMAGE (
		storeDetailImageId ASC
	);

ALTER TABLE STOREDETIALIMAGE
	ADD
		CONSTRAINT PK_STOREDETIALIMAGE
		PRIMARY KEY (
			storeDetailImageId
		);

/* 위시리스트 */
CREATE TABLE WISHLIST (
	wishId NUMBER NOT NULL, /* 위시id */
	fk_memberId NUMBER NOT NULL, /* 회원id */
	fk_productDetailId NUMBER NOT NULL, /* 상품정보id */
	isDeleted CHAR(1) NOT NULL, /* 삭제여부 */
	registerDay DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE WISHLIST IS '위시리스트';

COMMENT ON COLUMN WISHLIST.wishId IS '위시id';

COMMENT ON COLUMN WISHLIST.fk_memberId IS '회원id';

COMMENT ON COLUMN WISHLIST.fk_productDetailId IS '상품정보id';

COMMENT ON COLUMN WISHLIST.isDeleted IS '삭제여부';

COMMENT ON COLUMN WISHLIST.registerDay IS '등록일';

CREATE UNIQUE INDEX PK_WISHLIST
	ON WISHLIST (
		wishId ASC
	);

ALTER TABLE WISHLIST
	ADD
		CONSTRAINT PK_WISHLIST
		PRIMARY KEY (
			wishId
		);

/* 지점종류 */
CREATE TABLE STORECATEGORY (
	storeCategoryId NUMBER NOT NULL, /* 지점종류id */
	storeCategoryName NVARCHAR2(10) NOT NULL /* 지점종류명 */
);

COMMENT ON TABLE STORECATEGORY IS '지점종류';

COMMENT ON COLUMN STORECATEGORY.storeCategoryId IS '지점종류id';

COMMENT ON COLUMN STORECATEGORY.storeCategoryName IS '지점종류명';

CREATE UNIQUE INDEX PK_STORECATEGORY
	ON STORECATEGORY (
		storeCategoryId ASC
	);

ALTER TABLE STORECATEGORY
	ADD
		CONSTRAINT PK_STORECATEGORY
		PRIMARY KEY (
			storeCategoryId
		);

/* 상품종류 */
CREATE TABLE CATEGORY (
	categoryId NUMBER NOT NULL, /* 상품종류id */
	categoryName NVARCHAR2(10) NOT NULL /* 상품종류 */
);

COMMENT ON TABLE CATEGORY IS '상품종류';

COMMENT ON COLUMN CATEGORY.categoryId IS '상품종류id';

COMMENT ON COLUMN CATEGORY.categoryName IS '상품종류';

CREATE UNIQUE INDEX PK_CATEGORY
	ON CATEGORY (
		categoryId ASC
	);

ALTER TABLE CATEGORY
	ADD
		CONSTRAINT PK_CATEGORY
		PRIMARY KEY (
			categoryId
		);

/* 프레임컬러 */
CREATE TABLE FRAMECOLOR (
	frameColorId NUMBER NOT NULL, /* 프레임컬러id */
	frameColorENG VARCHAR2(15) NOT NULL, /* 프레임컬러영문 */
	frameColorKOR NVARCHAR2(10) NOT NULL /* 프레임컬러한글 */
);

COMMENT ON TABLE FRAMECOLOR IS '프레임컬러';

COMMENT ON COLUMN FRAMECOLOR.frameColorId IS '프레임컬러id';

COMMENT ON COLUMN FRAMECOLOR.frameColorENG IS '프레임컬러영문';

COMMENT ON COLUMN FRAMECOLOR.frameColorKOR IS '프레임컬러한글';

CREATE UNIQUE INDEX PK_FRAMECOLOR
	ON FRAMECOLOR (
		frameColorId ASC
	);

ALTER TABLE FRAMECOLOR
	ADD
		CONSTRAINT PK_FRAMECOLOR
		PRIMARY KEY (
			frameColorId
		);

/* 상품대분류 */
CREATE TABLE PRODUCTGROUP (
	productGroupId NUMBER NOT NULL, /* 상품대분류id */
	fk_categoryId NUMBER NOT NULL, /* 상품종류id */
	productGroupName NVARCHAR2(30) NOT NULL, /* 상품명 */
	price NUMBER NOT NULL, /* 가격 */
	fk_frameId NUMBER NOT NULL, /* 프레임id */
	fk_materialId NUMBER NOT NULL, /* 소재id */
	silhouette NVARCHAR2(20) NOT NULL, /* 실루엣 */
	detail NVARCHAR2(50) NOT NULL, /* 디테일 */
	frameSize NUMBER NOT NULL, /* 프레임사이즈 */
	templeLength NUMBER NOT NULL, /* 템플길이 */
	lenseWidthSize NUMBER NOT NULL, /* 렌즈가로사이즈 */
	lenseHeightSize NUMBER NOT NULL, /* 렌즈높이사이즈 */
	bridge NUMBER NOT NULL, /* 브릿지 */
	isDeleted CHAR(1) NOT NULL, /* 삭제여부 */
	registerDay DATE DEFAULT sysdate NOT NULL, /* 등록일 */
	updateDay DATE /* 업데이트일 */
);

COMMENT ON TABLE PRODUCTGROUP IS '상품대분류';

COMMENT ON COLUMN PRODUCTGROUP.productGroupId IS '상품대분류id';

COMMENT ON COLUMN PRODUCTGROUP.fk_categoryId IS '상품종류id';

COMMENT ON COLUMN PRODUCTGROUP.productGroupName IS '상품명';

COMMENT ON COLUMN PRODUCTGROUP.price IS '가격';

COMMENT ON COLUMN PRODUCTGROUP.fk_frameId IS '프레임id';

COMMENT ON COLUMN PRODUCTGROUP.fk_materialId IS '소재id';

COMMENT ON COLUMN PRODUCTGROUP.silhouette IS '실루엣';

COMMENT ON COLUMN PRODUCTGROUP.detail IS '디테일';

COMMENT ON COLUMN PRODUCTGROUP.frameSize IS '프레임사이즈';

COMMENT ON COLUMN PRODUCTGROUP.templeLength IS '템플길이';

COMMENT ON COLUMN PRODUCTGROUP.lenseWidthSize IS '렌즈가로사이즈';

COMMENT ON COLUMN PRODUCTGROUP.lenseHeightSize IS '렌즈높이사이즈';

COMMENT ON COLUMN PRODUCTGROUP.bridge IS '브릿지';

COMMENT ON COLUMN PRODUCTGROUP.isDeleted IS '삭제여부';

COMMENT ON COLUMN PRODUCTGROUP.registerDay IS '등록일';

COMMENT ON COLUMN PRODUCTGROUP.updateDay IS '업데이트일';

CREATE UNIQUE INDEX PK_PRODUCTGROUP
	ON PRODUCTGROUP (
		productGroupId ASC
	);

ALTER TABLE PRODUCTGROUP
	ADD
		CONSTRAINT PK_PRODUCTGROUP
		PRIMARY KEY (
			productGroupId
		);

/* 지점 */
CREATE TABLE STORE (
	storeId NUMBER NOT NULL, /* 지점id */
	storeName NVARCHAR2(20) NOT NULL, /* 지점명 */
	fk_countryId NUMBER NOT NULL, /* 유치국가id */
	fk_storeCategoryId NUMBER NOT NULL, /* 지점종류id */
	cityENG NVARCHAR2(20) NOT NULL, /* 지점도시영 */
	cityKOR NVARCHAR2(20) NOT NULL, /* 지점도시한 */
	address NVARCHAR2(255) NOT NULL, /* 주소 */
	tel VARCHAR2(14) NOT NULL, /* 전화번호 */
	openingHours VARCHAR2(30) NOT NULL, /* 영업시간 */
	description NVARCHAR2(255) NOT NULL, /* 소개 */
	mainImageFile NVARCHAR2(255), /* 대표사진경로 */
	idDeleted CHAR(1), /* 삭제여부 */
	registerDay DATE DEFAULT sysdate NOT NULL, /* 등록일 */
	updateDay DATE /* 업데이트 */
);

COMMENT ON TABLE STORE IS '지점';

COMMENT ON COLUMN STORE.storeId IS '지점id';

COMMENT ON COLUMN STORE.storeName IS '지점명';

COMMENT ON COLUMN STORE.fk_countryId IS '유치국가id';

COMMENT ON COLUMN STORE.fk_storeCategoryId IS '지점종류id';

COMMENT ON COLUMN STORE.cityENG IS '지점도시영';

COMMENT ON COLUMN STORE.cityKOR IS '지점도시한';

COMMENT ON COLUMN STORE.address IS '주소';

COMMENT ON COLUMN STORE.tel IS '전화번호';

COMMENT ON COLUMN STORE.openingHours IS '영업시간';

COMMENT ON COLUMN STORE.description IS '소개';

COMMENT ON COLUMN STORE.mainImageFile IS '대표사진경로';

COMMENT ON COLUMN STORE.idDeleted IS '삭제여부';

COMMENT ON COLUMN STORE.registerDay IS '등록일';

COMMENT ON COLUMN STORE.updateDay IS '업데이트';

CREATE UNIQUE INDEX PK_STORE
	ON STORE (
		storeId ASC
	);

ALTER TABLE STORE
	ADD
		CONSTRAINT PK_STORE
		PRIMARY KEY (
			storeId
		);

/* 프레임 */
CREATE TABLE FRAME (
	frameId NUMBER NOT NULL, /* 프레임id */
	frameName NVARCHAR2(20) NOT NULL /* 프레임 */
);

COMMENT ON TABLE FRAME IS '프레임';

COMMENT ON COLUMN FRAME.frameId IS '프레임id';

COMMENT ON COLUMN FRAME.frameName IS '프레임';

CREATE UNIQUE INDEX PK_FRAME
	ON FRAME (
		frameId ASC
	);

ALTER TABLE FRAME
	ADD
		CONSTRAINT PK_FRAME
		PRIMARY KEY (
			frameId
		);

/* 주문 */
CREATE TABLE ORDER (
	orderId VARCHAR2(50) NOT NULL, /* 주문번호id */
	fk_memberId NUMBER NOT NULL, /* 회원id */
	deliveryFee NUMBER NOT NULL, /* 배송비 */
	amount NUMBER NOT NULL, /* 총결제금액 */
	orderStatus CHAR(1) NOT NULL, /* 주문현황 */
	refundReason CHAR(1) NOT NULL, /* 환불사유 */
	name NVARCHAR2(15) NOT NULL, /* 받는사람이름 */
	postcode VARCHAR2(10) NOT NULL, /* 우편번호 */
	address NVARCHAR2(255) NOT NULL, /* 주소 */
	detailAddress NVARCHAR2(255) NOT NULL, /* 상세주소 */
	tel VARCHAR2(14) NOT NULL, /* 받는분전화번호 */
	orderDay DATE DEFAULT sysdate NOT NULL /* 주문날짜 */
);

COMMENT ON TABLE ORDER IS '주문';

COMMENT ON COLUMN ORDER.orderId IS '주문번호id';

COMMENT ON COLUMN ORDER.fk_memberId IS '회원id';

COMMENT ON COLUMN ORDER.deliveryFee IS '배송비';

COMMENT ON COLUMN ORDER.amount IS '총결제금액';

COMMENT ON COLUMN ORDER.orderStatus IS '주문현황';

COMMENT ON COLUMN ORDER.refundReason IS '환불사유';

COMMENT ON COLUMN ORDER.name IS '받는사람이름';

COMMENT ON COLUMN ORDER.postcode IS '우편번호';

COMMENT ON COLUMN ORDER.address IS '주소';

COMMENT ON COLUMN ORDER.detailAddress IS '상세주소';

COMMENT ON COLUMN ORDER.tel IS '받는분전화번호';

COMMENT ON COLUMN ORDER.orderDay IS '주문날짜';

CREATE UNIQUE INDEX PK_ORDER
	ON ORDER (
		orderId ASC
	);

ALTER TABLE ORDER
	ADD
		CONSTRAINT PK_ORDER
		PRIMARY KEY (
			orderId
		);

/* 소재 */
CREATE TABLE MATERIAL (
	materialId NUMBER NOT NULL, /* 소재id */
	materialName NVARCHAR2(30) NOT NULL /* 소재 */
);

COMMENT ON TABLE MATERIAL IS '소재';

COMMENT ON COLUMN MATERIAL.materialId IS '소재id';

COMMENT ON COLUMN MATERIAL.materialName IS '소재';

CREATE UNIQUE INDEX PK_MATERIAL
	ON MATERIAL (
		materialId ASC
	);

ALTER TABLE MATERIAL
	ADD
		CONSTRAINT PK_MATERIAL
		PRIMARY KEY (
			materialId
		);

/* 상품정보 */
CREATE TABLE PRODUCTDETAIL (
	productDetailId NUMBER NOT NULL, /* 상품정보id */
	fk_productGroupId NUMBER NOT NULL, /* 상품대분류id */
	fk_frameColorId NUMBER NOT NULL, /* 프레임컬러id */
	fk_lenseColorId NUMBER NOT NULL, /* 렌즈컬러id */
	gender CHAR(1) NOT NULL, /* 젠더 */
	isMirror CHAR(1) NOT NULL, /* 미러여부 */
	description NVARCHAR2(255) NOT NULL, /* 소개 */
	isTint CHAR(1) NOT NULL, /* 틴트여부 */
	isGift CHAR(1) NOT NULL, /* 선물추천여부 */
	isBlueLight CHAR(1) NOT NULL, /* 블루라이트차단여부 */
	stock NUMBER NOT NULL, /* 재고 */
	isDeleted CHAR(1) NOT NULL, /* 삭제여부 */
	isIndex CHAR(1) NOT NULL, /* 인덱스상품여부 */
	mainImageFile NVARCHAR2(255) NOT NULL, /* 대표사진경로 */
	registerDay DATE DEFAULT sysdate NOT NULL, /* 등록일 */
	updateDay DATE /* 업데이트일 */
);

COMMENT ON TABLE PRODUCTDETAIL IS '상품정보';

COMMENT ON COLUMN PRODUCTDETAIL.productDetailId IS '상품정보id';

COMMENT ON COLUMN PRODUCTDETAIL.fk_productGroupId IS '상품대분류id';

COMMENT ON COLUMN PRODUCTDETAIL.fk_frameColorId IS '프레임컬러id';

COMMENT ON COLUMN PRODUCTDETAIL.fk_lenseColorId IS '렌즈컬러id';

COMMENT ON COLUMN PRODUCTDETAIL.gender IS '젠더';

COMMENT ON COLUMN PRODUCTDETAIL.isMirror IS '미러여부';

COMMENT ON COLUMN PRODUCTDETAIL.description IS '소개';

COMMENT ON COLUMN PRODUCTDETAIL.isTint IS '틴트여부';

COMMENT ON COLUMN PRODUCTDETAIL.isGift IS '선물추천여부';

COMMENT ON COLUMN PRODUCTDETAIL.isBlueLight IS '블루라이트차단여부';

COMMENT ON COLUMN PRODUCTDETAIL.stock IS '재고';

COMMENT ON COLUMN PRODUCTDETAIL.isDeleted IS '삭제여부';

COMMENT ON COLUMN PRODUCTDETAIL.isIndex IS '인덱스상품여부';

COMMENT ON COLUMN PRODUCTDETAIL.mainImageFile IS '대표사진경로';

COMMENT ON COLUMN PRODUCTDETAIL.registerDay IS '등록일';

COMMENT ON COLUMN PRODUCTDETAIL.updateDay IS '업데이트일';

CREATE UNIQUE INDEX PK_PRODUCTDETAIL
	ON PRODUCTDETAIL (
		productDetailId ASC
	);

ALTER TABLE PRODUCTDETAIL
	ADD
		CONSTRAINT PK_PRODUCTDETAIL
		PRIMARY KEY (
			productDetailId
		);

/* 유치국가 */
CREATE TABLE COUNTRY (
	countryId NUMBER NOT NULL, /* 유치국가id */
	countryName NVARCHAR2(20) NOT NULL /* 국가명 */
);

COMMENT ON TABLE COUNTRY IS '유치국가';

COMMENT ON COLUMN COUNTRY.countryId IS '유치국가id';

COMMENT ON COLUMN COUNTRY.countryName IS '국가명';

CREATE UNIQUE INDEX PK_COUNTRY
	ON COUNTRY (
		countryId ASC
	);

ALTER TABLE COUNTRY
	ADD
		CONSTRAINT PK_COUNTRY
		PRIMARY KEY (
			countryId
		);

/* 회원 */
CREATE TABLE MEMBER (
	memberId NUMBER NOT NULL, /* 회원id */
	email VARCHAR2(100) NOT NULL, /* 이메일주소 */
	pwd VARCHAR2(50) NOT NULL, /* 비밀번호 */
	gender CHAR(1), /* 성별 */
	familyName NVARCHAR2(5) NOT NULL, /* 성 */
	lastName NVARCHAR2(10) NOT NULL, /* 이름 */
	birth DATE NOT NULL, /* 생년월일 */
	grade CHAR(1) NOT NULL, /* 등급 */
	isDeleted CHAR(1) NOT NULL, /* 회원탈퇴여부 */
	registerDay DATE DEFAULT sysdate NOT NULL, /* 등록일 */
	updateDay DATE /* 업데이트일 */
);

COMMENT ON TABLE MEMBER IS '회원';

COMMENT ON COLUMN MEMBER.memberId IS '회원id';

COMMENT ON COLUMN MEMBER.email IS '이메일주소';

COMMENT ON COLUMN MEMBER.pwd IS '비밀번호';

COMMENT ON COLUMN MEMBER.gender IS '성별';

COMMENT ON COLUMN MEMBER.familyName IS '성';

COMMENT ON COLUMN MEMBER.lastName IS '이름';

COMMENT ON COLUMN MEMBER.birth IS '생년월일';

COMMENT ON COLUMN MEMBER.grade IS '등급';

COMMENT ON COLUMN MEMBER.isDeleted IS '회원탈퇴여부';

COMMENT ON COLUMN MEMBER.registerDay IS '등록일';

COMMENT ON COLUMN MEMBER.updateDay IS '업데이트일';

CREATE UNIQUE INDEX PK_MEMBER
	ON MEMBER (
		memberId ASC
	);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			memberId
		);

/* 상품추가이미지 */
CREATE TABLE PRODUCTDETIALIMAGE (
	productDetailImageId NUMBER NOT NULL, /* 상품추가이미지id */
	fk_productDetailId NUMBER NOT NULL, /* 상품정보id */
	imageFile NVARCHAR2(255) NOT NULL, /* 이미지파일명 */
	position CHAR(2) NOT NULL /* 순서 */
);

COMMENT ON TABLE PRODUCTDETIALIMAGE IS '상품추가이미지';

COMMENT ON COLUMN PRODUCTDETIALIMAGE.productDetailImageId IS '상품추가이미지id';

COMMENT ON COLUMN PRODUCTDETIALIMAGE.fk_productDetailId IS '상품정보id';

COMMENT ON COLUMN PRODUCTDETIALIMAGE.imageFile IS '이미지파일명';

COMMENT ON COLUMN PRODUCTDETIALIMAGE.position IS '순서';

CREATE UNIQUE INDEX PK_PRODUCTDETIALIMAGE
	ON PRODUCTDETIALIMAGE (
		productDetailImageId ASC
	);

ALTER TABLE PRODUCTDETIALIMAGE
	ADD
		CONSTRAINT PK_PRODUCTDETIALIMAGE
		PRIMARY KEY (
			productDetailImageId
		);

/* 주소록 */
CREATE TABLE ADDRESSBOOK (
	addressbookId NUMBER NOT NULL, /* 주소록id */
	fk_memberId NUMBER NOT NULL, /* 회원id */
	familyName NVARCHAR2(5) NOT NULL, /* 성 */
	lastName NVARCHAR2(10) NOT NULL, /* 이름 */
	tel VARCHAR2(14) NOT NULL, /* 전화번호 */
	address NVARCHAR2(255) NOT NULL, /* 주소 */
	detailAddress NVARCHAR2(255) NOT NULL, /* 상세주소 */
	postcode VARCHAR2(10) NOT NULL, /* 우편번호 */
	isDefaultAddr CHAR(1) NOT NULL, /* 기본배송지여부 */
	isDeleted CHAR(1) NOT NULL, /* 삭제여부 */
	registerDay DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE ADDRESSBOOK IS '주소록';

COMMENT ON COLUMN ADDRESSBOOK.addressbookId IS '주소록id';

COMMENT ON COLUMN ADDRESSBOOK.fk_memberId IS '회원id';

COMMENT ON COLUMN ADDRESSBOOK.familyName IS '성';

COMMENT ON COLUMN ADDRESSBOOK.lastName IS '이름';

COMMENT ON COLUMN ADDRESSBOOK.tel IS '전화번호';

COMMENT ON COLUMN ADDRESSBOOK.address IS '주소';

COMMENT ON COLUMN ADDRESSBOOK.detailAddress IS '상세주소';

COMMENT ON COLUMN ADDRESSBOOK.postcode IS '우편번호';

COMMENT ON COLUMN ADDRESSBOOK.isDefaultAddr IS '기본배송지여부';

COMMENT ON COLUMN ADDRESSBOOK.isDeleted IS '삭제여부';

COMMENT ON COLUMN ADDRESSBOOK.registerDay IS '등록일';

CREATE UNIQUE INDEX PK_ADDRESSBOOK
	ON ADDRESSBOOK (
		addressbookId ASC
	);

ALTER TABLE ADDRESSBOOK
	ADD
		CONSTRAINT PK_ADDRESSBOOK
		PRIMARY KEY (
			addressbookId
		);

/* 렌즈컬러 */
CREATE TABLE LENSECOLOR (
	lenseColorId NUMBER NOT NULL, /* 렌즈컬러id */
	lenseColorENG VARCHAR2(15) NOT NULL, /* 렌즈컬러영문 */
	lenseColorKOR NVARCHAR2(10) NOT NULL /* 렌즈컬러한글 */
);

COMMENT ON TABLE LENSECOLOR IS '렌즈컬러';

COMMENT ON COLUMN LENSECOLOR.lenseColorId IS '렌즈컬러id';

COMMENT ON COLUMN LENSECOLOR.lenseColorENG IS '렌즈컬러영문';

COMMENT ON COLUMN LENSECOLOR.lenseColorKOR IS '렌즈컬러한글';

CREATE UNIQUE INDEX PK_LENSECOLOR
	ON LENSECOLOR (
		lenseColorId ASC
	);

ALTER TABLE LENSECOLOR
	ADD
		CONSTRAINT PK_LENSECOLOR
		PRIMARY KEY (
			lenseColorId
		);

/* 주문상세 */
CREATE TABLE ORDERDETAIL (
	orderDetailId VARCHAR2(50) NOT NULL, /* 주문상세번호id */
	fk_orderId VARCHAR2(50) NOT NULL, /* 주문번호id */
	fk_productDetailId NUMBER NOT NULL, /* 상품정보id */
	price NUMBER NOT NULL, /* 가격 */
	quantity NUMBER NOT NULL /* 개수 */
);

COMMENT ON TABLE ORDERDETAIL IS '주문상세';

COMMENT ON COLUMN ORDERDETAIL.orderDetailId IS '주문상세번호id';

COMMENT ON COLUMN ORDERDETAIL.fk_orderId IS '주문번호id';

COMMENT ON COLUMN ORDERDETAIL.fk_productDetailId IS '상품정보id';

COMMENT ON COLUMN ORDERDETAIL.price IS '가격';

COMMENT ON COLUMN ORDERDETAIL.quantity IS '개수';

CREATE UNIQUE INDEX PK_ORDERDETAIL
	ON ORDERDETAIL (
		orderDetailId ASC
	);

ALTER TABLE ORDERDETAIL
	ADD
		CONSTRAINT PK_ORDERDETAIL
		PRIMARY KEY (
			orderDetailId
		);

/* 스타일 */
CREATE TABLE STYLE (
	styleId NUMBER NOT NULL, /* 스타일id */
	fk_productDetailId NUMBER NOT NULL, /* 상품정보id */
	instaId VARCHAR(30) NOT NULL, /* 인스타아이디 */
	imageFile NVARCHAR2(255) NOT NULL /* 사진경로 */
);

COMMENT ON TABLE STYLE IS '스타일';

COMMENT ON COLUMN STYLE.styleId IS '스타일id';

COMMENT ON COLUMN STYLE.fk_productDetailId IS '상품정보id';

COMMENT ON COLUMN STYLE.instaId IS '인스타아이디';

COMMENT ON COLUMN STYLE.imageFile IS '사진경로';

CREATE UNIQUE INDEX PK_STYLE
	ON STYLE (
		styleId ASC
	);

ALTER TABLE STYLE
	ADD
		CONSTRAINT PK_STYLE
		PRIMARY KEY (
			styleId
		);

/* 쇼핑백 */
CREATE TABLE CART (
	cartId NUMBER NOT NULL, /* 쇼핑백id */
	fk_memberId NUMBER NOT NULL, /* 회원id */
	fk_productDetailId NUMBER NOT NULL, /* 상품정보id */
	quantity NUMBER NOT NULL, /* 수량 */
	registerDay DATE DEFAULT sysdate NOT NULL /* 장바구니등록날짜 */
);

COMMENT ON TABLE CART IS '쇼핑백';

COMMENT ON COLUMN CART.cartId IS '쇼핑백id';

COMMENT ON COLUMN CART.fk_memberId IS '회원id';

COMMENT ON COLUMN CART.fk_productDetailId IS '상품정보id';

COMMENT ON COLUMN CART.quantity IS '수량';

COMMENT ON COLUMN CART.registerDay IS '장바구니등록날짜';

CREATE UNIQUE INDEX PK_CART
	ON CART (
		cartId ASC
	);

ALTER TABLE CART
	ADD
		CONSTRAINT PK_CART
		PRIMARY KEY (
			cartId
		);

ALTER TABLE STOREDETIALIMAGE
	ADD
		CONSTRAINT FK_STORE_TO_STOREDETIALIMAGE
		FOREIGN KEY (
			fk_storeId
		)
		REFERENCES STORE (
			storeId
		);

ALTER TABLE WISHLIST
	ADD
		CONSTRAINT FK_MEMBER_TO_WISHLIST
		FOREIGN KEY (
			fk_memberId
		)
		REFERENCES MEMBER (
			memberId
		);

ALTER TABLE WISHLIST
	ADD
		CONSTRAINT FK_PRODUCTDETAIL_TO_WISHLIST
		FOREIGN KEY (
			fk_productDetailId
		)
		REFERENCES PRODUCTDETAIL (
			productDetailId
		);

ALTER TABLE PRODUCTGROUP
	ADD
		CONSTRAINT FK_CATEGORY_TO_PRODUCTGROUP
		FOREIGN KEY (
			fk_categoryId
		)
		REFERENCES CATEGORY (
			categoryId
		);

ALTER TABLE PRODUCTGROUP
	ADD
		CONSTRAINT FK_MATERIAL_TO_PRODUCTGROUP
		FOREIGN KEY (
			fk_materialId
		)
		REFERENCES MATERIAL (
			materialId
		);

ALTER TABLE PRODUCTGROUP
	ADD
		CONSTRAINT FK_FRAME_TO_PRODUCTGROUP
		FOREIGN KEY (
			fk_frameId
		)
		REFERENCES FRAME (
			frameId
		);

ALTER TABLE STORE
	ADD
		CONSTRAINT FK_COUNTRY_TO_STORE
		FOREIGN KEY (
			fk_countryId
		)
		REFERENCES COUNTRY (
			countryId
		);

ALTER TABLE STORE
	ADD
		CONSTRAINT FK_STORECATEGORY_TO_STORE
		FOREIGN KEY (
			fk_storeCategoryId
		)
		REFERENCES STORECATEGORY (
			storeCategoryId
		);

ALTER TABLE ORDER
	ADD
		CONSTRAINT FK_MEMBER_TO_ORDER
		FOREIGN KEY (
			fk_memberId
		)
		REFERENCES MEMBER (
			memberId
		);

ALTER TABLE PRODUCTDETAIL
	ADD
		CONSTRAINT FK_PRODUCTGROUP_TO_PRDCTDTL
		FOREIGN KEY (
			fk_productGroupId
		)
		REFERENCES PRODUCTGROUP (
			productGroupId
		);

ALTER TABLE PRODUCTDETAIL
	ADD
		CONSTRAINT FK_FRAMECOLOR_TO_PRODUCTDETAIL
		FOREIGN KEY (
			fk_frameColorId
		)
		REFERENCES FRAMECOLOR (
			frameColorId
		);

ALTER TABLE PRODUCTDETAIL
	ADD
		CONSTRAINT FK_LENSECOLOR_TO_PRODUCTDETAIL
		FOREIGN KEY (
			fk_lenseColorId
		)
		REFERENCES LENSECOLOR (
			lenseColorId
		);

ALTER TABLE PRODUCTDETIALIMAGE
	ADD
		CONSTRAINT FK_PRDCTDTL_TO_PRDCTDTLMG
		FOREIGN KEY (
			fk_productDetailId
		)
		REFERENCES PRODUCTDETAIL (
			productDetailId
		);

ALTER TABLE ADDRESSBOOK
	ADD
		CONSTRAINT FK_MEMBER_TO_ADDRESSBOOK
		FOREIGN KEY (
			fk_memberId
		)
		REFERENCES MEMBER (
			memberId
		);

ALTER TABLE ORDERDETAIL
	ADD
		CONSTRAINT FK_ORDER_TO_ORDERDETAIL
		FOREIGN KEY (
			fk_orderId
		)
		REFERENCES ORDER (
			orderId
		);

ALTER TABLE ORDERDETAIL
	ADD
		CONSTRAINT FK_PRODUCTDETAIL_TO_ORDRDTL
		FOREIGN KEY (
			fk_productDetailId
		)
		REFERENCES PRODUCTDETAIL (
			productDetailId
		);

ALTER TABLE STYLE
	ADD
		CONSTRAINT FK_PRODUCTDETAIL_TO_STYLE
		FOREIGN KEY (
			fk_productDetailId
		)
		REFERENCES PRODUCTDETAIL (
			productDetailId
		);

ALTER TABLE CART
	ADD
		CONSTRAINT FK_MEMBER_TO_CART
		FOREIGN KEY (
			fk_memberId
		)
		REFERENCES MEMBER (
			memberId
		);

ALTER TABLE CART
	ADD
		CONSTRAINT FK_PRODUCTDETAIL_TO_CART
		FOREIGN KEY (
			fk_productDetailId
		)
		REFERENCES PRODUCTDETAIL (
			productDetailId
		);
















--------------------------------------------------------
--  DDL for Sequence SEQ_ADDRESSBOOK
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ADDRESSBOOK"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_BATCHKEY
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_BATCHKEY"  MINVALUE 0 MAXVALUE 99999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_CART
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_CART"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_CATEGORY
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_CATEGORY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_COUNTRY
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_COUNTRY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_FRAME
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_FRAME"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_FRAMECOLOR
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_FRAMECOLOR"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_LENSECOLOR
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_LENSECOLOR"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_MATERIAL
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_MATERIAL"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_MEMBER
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_MEMBER"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_ORDER
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ORDER"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_ORDERDETAIL
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ORDERDETAIL"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_PAYMENT
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PAYMENT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_PRODUCTDETAIL
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PRODUCTDETAIL"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_PRODUCTDETAILIMAGE
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PRODUCTDETAILIMAGE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_PRODUCTGROUP
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PRODUCTGROUP"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_STORE
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_STORE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_STORECATEGORY
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_STORECATEGORY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_STOREDETAILIMAGE
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_STOREDETAILIMAGE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_STYLE
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_STYLE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_TEST
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_TEST"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_WISHLIST
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_WISHLIST"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL

















create or replace NONEDITIONABLE FUNCTION "ZBF_GET_BATCHKEY" (
    p_type in varchar2
) RETURN VARCHAR2
AS
     v_returnValue VARCHAR2(180);
BEGIN

    BEGIN

        select TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(SEQ_BATCHKEY.nextval, 5, 0) --currval로 바꾸기 가능
          into v_returnValue
          from dual;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        v_returnValue := ' ';
      WHEN OTHERS THEN
        v_returnValue := ' ';
    END;

    RETURN v_returnValue;
END;






create or replace NONEDITIONABLE PROCEDURE "SZP_BATCHKEY_RESET" (SEQ_NAME IN VARCHAR2)
IS
    L_VAL NUMBER;
BEGIN

    EXECUTE IMMEDIATE 'SELECT '|| SEQ_NAME ||'.NEXTVAL FROM DUAL' INTO L_VAL;

    EXECUTE IMMEDIATE 'ALTER SEQUENCE '|| SEQ_NAME ||' INCREMENT BY -'|| L_VAL ||' MINVALUE 0';

    EXECUTE IMMEDIATE 'SELECT '|| SEQ_NAME ||'.NEXTVAL FROM DUAL' INTO L_VAL;

    EXECUTE IMMEDIATE 'ALTER SEQUENCE '|| SEQ_NAME ||' INCREMENT BY 1 MINVALUE 0';

END;
