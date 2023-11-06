$(document).ready(function() {

	/* contextPath 생성용 */
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;
	/* end of contextPath 생성용 */


	/* 상품명 셀렉트박스 동적생성 위헤 보존용*/
	let select_productNameHtml = $("td#productSelector").html();
	const select_productNameHistory = $("select#productName").html();
	/* end of 상품명 셀렉트박스 동적생성 위헤 보존용*/


	// 존재하는 상품정보를 수정할 경우 파일을 첨부하지 않아도 되도록 기존 상품인지 여부를 알려준다
	let isExist = false;

	// 초기 로딩시에는 에러 문구를 다 숨겨둔다
	$(document).find("span.alert").hide();


	/* 가격 숫자만 입력할 수 있도록한다 */
	$("#price").keyup(function() {
		var replace_text = $(this).val().replace(/[^-0-9]/g, '');
		$(this).val(replace_text);
	});

	/* 재고 1 미만으로 입력 못하게 한다 */
	$("#stock").keyup(function() {
		if ($("#stock").val() < 1) {
			$("#stock").val(1);
		}
	});

	/* 사이즈 숫자 및 소수점 하나만 입력할 수 있도록한다 */
	$(".size").each(function() {
		$(this).keyup(function() {
			if ($(this).val() != null && $(this).val() != '') {
				var tmps = $(this).val().replace(/[^\.|^0(0)+|^0-9\.]/g, '');
				/* 소수점은 하나만 입력되도록*/
				var arr = tmps.split(".");
				if (arr.length > 2) {
					tmps = arr[0] + '.' + arr[1];
				}
				$(this).val(tmps);
			}
		});
		$(this).focusout(function() {
			if ($(this).val() != null && $(this).val() != '') {
				var tmps = $(this).val().replace(/[^\.|^0(0)+|^0-9\.]/g, '');

				/* 소수점은 하나만 입력되도록*/
				var arr = tmps.split(".");
				if (arr.length > 2) {
					tmps = arr[0] + '.' + arr[1];
				}
				$(this).val(tmps);
			}
		});
	});




	/* 상품명 추가 버튼 눌렀을 경우 */
	$(document).on("click", "button.addProductNameBtn", function() {
		/* 추가할 상품명 입력 인풋태그 생성 및 셀렉트박스 삭제*/
		$(this).siblings("select#productName").remove();
		$(this).parent().html(
			`<input type="text" id="addProductNameInput" placeholder="추가할 상품명을 입력하세요" size="30" name="addProductNameInput" />
			 <button type="button" class="selectProductNameBtn btn btn-secondary">상품명 선택으로 변경</button>
			`);

		/* 유저가 입력값을 수정할 수 있도록 한다 */
		$("input[type='text']").each(function() {
			$(this).attr("disabled", false);
			//$(this).val("");
		})

		$("input:radio").each(function() {
			if ($(this).attr("name") != "isBlueLight") {
				$(this).attr("disabled", false);
			}

		})
		$("textarea").attr("disabled", false);
		/* end of 유저가 입력값을 수정할 수 있도록 한다 */

		// 유저가 데이터베이스에 등록해뒀던 이미지의 미리보기가 존재할 수 있으니 지운다
		$("img.previewImg").attr("src", "")

	})




	/* 상품명 선택 버튼 눌렀을 경우 */
	$(document).on("click", "button.selectProductNameBtn", function() {

		/* 추가할 상품명 입력 인풋태그 삭제 및 셀렉트박스 생성*/
		$(this).siblings("input.addProductNameInput").remove();

		$.ajax({

			url: contextPath + "admin/addProduct.gm",
			data: { "categoryId": $("input[name='category']:checked").val() },
			type: "get",
			async: true,
			dataType: "json",
			success: function(text) {
				let html = ``;
				for (let i = 0; i < text.length; i++) {
					html += `<option value="` + text[i]['productGroupId'] + `">` + text[i]['productGroupName'] + `</option>`
				}

				$("button.selectProductNameBtn").parent().html(
					`<select name="productName" id="productName">`
					+ select_productNameHistory + html
					+ `</select>
					<button type="button" class="addProductNameBtn btn btn-secondary">상품명 추가</button>`
				);
			},
			error: function(request, status, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});

		/* 기존에 입력해뒀던 셀렉트 값을 초기화 한다 */
		$("#frameColor > option:selected").prop("selected", false);
		$("#lenseColor > option:selected").prop("selected", false);
		/* end of 기존에 입력해뒀던 셀렉트 값을 초기화 한다 */
	})




	/* 상품 카테고리 라디오 박스에서 눌렀을 경우 */
	$(document).on("change", "input[name='category']", function() {

		// 유저가 데이터베이스에 등록해뒀던 이미지의 미리보기가 존재할 수 있으니 지운다
		$("img.previewImg").attr("src", "")

		if ($(this).val() == 1) {
			/* 선글라스라면 블루라이트 차단을 무로 고정한다*/

			$("input:radio[name='isBlueLight']:radio[value='0']").prop('checked', true);
			$("input:radio[name='isBlueLight']").attr("disabled", true);
		} else {
			/* 안경이라면 블루라이트 차단을 마음대로 설정할 수 있도록 한다 */

			$("input:radio[name='isBlueLight']").prop("checked", false);
			$("input:radio[name='isBlueLight']").attr("disabled", false);
		}

		/* 선택한 카테고리에 해당되는 상품명을 취득한다 */
		if ($("#productName").length == 1) {
			/* 상품명 셀렉트박스가 존재하는 경우 */
			$.ajax({
				url: contextPath + "admin/addProduct.gm",
				data: { "categoryId": $(this).val() },
				type: "get",
				async: true,
				dataType: "json",
				success: function(text) {
					let html = ``;
					for (let i = 0; i < text.length; i++) {
						html += `<option value="` + text[i]['productGroupId'] + `">` + text[i]['productGroupName'] + `</option>`
					}

					$("select#productName").html(select_productNameHistory + html);
				},
				error: function(request, status, error) {
					alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
				}
			});

			/* 기존에 입력해뒀던 상품의 값을 초기화 한다*/
			$("input[type='text']").each(function() {
				$(this).attr("disabled", false);
				$(this).val("");
			})

			$("input[type='radio']").each(function() {
				if ($(this).attr("name") != "category") {
					$(this).attr("disabled", false);
					$(this).prop("checked", false);
				}

			})

			$("textarea").attr("disabled", false);
			$("textarea").val("");

			$("input[name='stock']").val("");

			$("#frameColor > option:selected").prop("selected", false);
			$("#lenseColor > option:selected").prop("selected", false);
			/* end of 기존에 입력해뒀던 상품의 값을 초기화 한다*/
		}
	})




	/* 상품명 셀렉트 박스에서 상품명을 눌렀을 경우 */
	$(document).on("change", "select#productName", function() {
		// 유저가 데이터베이스에 등록해뒀던 이미지의 미리보기가 존재할 수 있으니 지운다
		$("img.previewImg").attr("src", "")


		/* 기존에 입력해뒀던 상품의 값을 초기화 한다*/
		$("input[type='text']").each(function() {
			$(this).attr("disabled", false);
			$(this).val("");
		})

		$("input[name='stock']").val("");

		$("input[type='radio']").each(function() {
			if ($(this).attr("name") != "category") {
				$(this).attr("disabled", false);
				$(this).prop("checked", false);
			}

		})

		$("textarea").attr("disabled", false);
		$("textarea").val("");


		$("#frameColor > option:selected").prop("selected", false);
		$("#lenseColor > option:selected").prop("selected", false);
		/* end of 기존에 입력해뒀던 상품의 값을 초기화 한다*/


		$.ajax({
			url: contextPath + "admin/addProduct.gm",
			data: { "productGroupId": $("select#productName > option:selected").val() },
			type: "get",
			async: true,
			dataType: "json",
			success: function(text) {
				$("input:radio[name='category']:radio[value='" + text.categoryId + "']").prop('checked', true);

				$("input:radio[name='frame']").attr("disabled", true);
				$("input:radio[name='frame']:radio[value='" + text.frameId + "']").prop('checked', true);

				$("input:radio[name='material']").attr("disabled", true);
				$("input:radio[name='material']:radio[value='" + text.materialId + "']").prop('checked', true);

				$("input[name='price']").val(text.price).attr("disabled", true);
				$("input[name='silhouette']").val(text.silhouette).attr("disabled", true);
				$("input[name='detail']").val(text.detail).attr("disabled", true);
				$("input[name='templeLength']").val(text.templeLength).attr("disabled", true);
				$("input[name='lenseWidthSize']").val(text.lenseWidthSize).attr("disabled", true);
				$("input[name='lenseHeightSize']").val(text.lenseHeightSize).attr("disabled", true);
				$("input[name='frameSize']").val(text.frameSize).attr("disabled", true);
				$("input[name='bridge']").val(text.bridge).attr("disabled", true);

			},
			error: function(request, status, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});

	})



	/* 리셋버튼 눌렀을 경우 */
	$("button.resetBtn").click(function() {
		$("input[type='text']").each(function() {
			$(this).attr("disabled", false);
		})
		$("input[type='radio']").attr("disabled", false);

		// 유저가 데이터베이스에 등록해뒀던 이미지의 미리보기가 존재할 수 있으니 지운다
		$("img.previewImg").attr("src", "")
	});




	/* 프레임 컬러가 변경 되었을 경우 */
	$(document).on("change", "#frameColor", function() {

		// 렌즈컬러, 프레임컬러, 상품명, 카테고리가 전부 선택되어있는지 확인용 // true = 문제 없음, false = 문제 있음
		let check = true;

		if ($('#lenseColor > option:selected').val() == "") {
			// 렌즈 컬러가 선택되어 있지 않을 경우	
			check = false;
		}

		if (!$("input:radio[name='category']").is(':checked')) {
			// 상품 종류가 선택되어 있지 않을 경우
			check = false;
		}

		if ($("#productName").length == 1) {
			if ($('#productName > option:selected').val() == "") {
				// 선택하지 않았을 경우
				check = false;
			}
		} else {
			check = false;
		}

		if ($('#frameColor > option:selected').val() == "") {
			check = false;
		}

		if (check) {
			// 렌즈컬러, 프레임컬러, 상품명, 카테고리가 일치하는 상품의 정보를 취득한다

			$.ajax({
				url: contextPath + "admin/addProduct.gm",
				data: {
					"productGroupId": $("select#productName > option:selected").val(),
					"lenseColor": $('#lenseColor > option:selected').val(),
					"category": $("input[name='category']:checked").val(),
					"frameColor": $('#frameColor > option:selected').val()
				},
				type: "get",
				async: true,
				dataType: "json",
				success: function(text) {

					if (text.isExist) {
						// 상품이 존재할 경우

						$("input:radio[name='category']:radio[value='" + text.categoryId + "']").prop('checked', true);

						$("input:radio[name='frame']").attr("disabled", true);
						$("input:radio[name='frame']:radio[value='" + text.frameId + "']").prop('checked', true);

						$("input:radio[name='material']").attr("disabled", true);
						$("input:radio[name='material']:radio[value='" + text.materialId + "']").prop('checked', true);

						$("input[name='price']").val(text.price).attr("disabled", true);

						$("input[name='silhouette']").val(text.silhouette).attr("disabled", true);
						$("input[name='detail']").val(text.detail).attr("disabled", true);
						$("input[name='templeLength']").val(text.templeLength).attr("disabled", true);
						$("input[name='lenseWidthSize']").val(text.lenseWidthSize).attr("disabled", true);
						$("input[name='lenseHeightSize']").val(text.lenseHeightSize).attr("disabled", true);
						$("input[name='frameSize']").val(text.frameSize).attr("disabled", true);
						$("input[name='bridge']").val(text.bridge).attr("disabled", true);


						$("input:radio[name='gender']:radio[value='" + text.gender + "']").prop('checked', true);
						$("input:radio[name='gender']").attr("disabled", true);

						$("input:radio[name='isMirror']:radio[value='" + text.isMirror + "']").prop('checked', true);
						$("input:radio[name='isMirror']").attr("disabled", true);

						$("input:radio[name='isTint']:radio[value='" + text.isTint + "']").prop('checked', true);
						$("input:radio[name='isTint']").attr("disabled", true);

						$("input:radio[name='isBlueLight']:radio[value='" + text.isBlueLight + "']").prop('checked', true);
						$("input:radio[name='isBlueLight']").attr("disabled", true);

						$("input:radio[name='isIndex']:radio[value='" + text.isIndex + "']").prop('checked', true);
						$("input:radio[name='isIndex']").attr("disabled", true);

						$("input:radio[name='isGift']:radio[value='" + text.isGift + "']").prop('checked', true);
						$("input:radio[name='isGift']").attr("disabled", true);

						$("textarea#description").val(text.description).attr("disabled", true);

						$("input[name='stock']").val(text.stock);

						$("input#mainImageFile").siblings("img.previewImg").attr("src", contextPath + text.mainImageFile.substr(1, text.mainImageFile.length));

						for (let i = 0; i < text.detailImageList.length; i++) {
							$("input#imageFile" + (i + 1)).siblings("img.previewImg").attr("src", contextPath + text.detailImageList[i]['imageFile' + (i + 1)].substr(1, text.detailImageList[i]['imageFile' + (i + 1)].length))
						}


						// mainImageFile의 존재 여부를 체크하기 위함 
						isExist = true;

					} else {
						// 상품이 존재하지 않을 경우

						$("input[name='gender']").prop('checked', false);
						$("input[name='gender']").attr("disabled", false);

						$("input[name='isMirror']").prop('checked', false);
						$("input[name='isMirror']").attr("disabled", false);

						$("input[name='isTint']").prop('checked', false);
						$("input[name='isTint']").attr("disabled", false);

						$("input[name='isBlueLight']").prop('checked', false);
						$("input[name='isBlueLight']").attr("disabled", false);

						$("input[name='isIndex']").prop('checked', false);
						$("input[name='isIndex']").attr("disabled", false);

						$("input[name='isGift']").prop('checked', false);
						$("input[name='isGift']").attr("disabled", false);

						$("textarea#description").val("").attr("disabled", false);

						$("input[name='stock']").val("");

						$("img.previewImg").attr("src", "");

						// mainImageFile의 존재 여부를 체크하기 위함 
						isExist = false;
					}


				},
				error: function(request, status, error) {
					alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
				}
			});

		}




	})



	/* 렌즈 컬러가 변경 되었을 경우 */
	$(document).on("change", "#lenseColor", function() {
		let check = true;

		if ($('#frameColor > option:selected').val() == "") {
			// 프레임 컬러가 선택되어 있지 않을 경우	
			check = false;
		}

		if (!$("input:radio[name='category']").is(':checked')) {
			// 상품 종류가 선택되어 있지 않을 경우
			check = false;
		}

		if ($("#productName").length == 1) {
			if ($('#productName > option:selected').val() == "") {
				// 선택하지 않았을 경우
				check = false;
			}
		} else {
			check = false;
		}
		if ($('#lenseColor > option:selected').val() == "") {
			// 렌즈 컬러가 선택되어 있지 않을 경우	
			check = false;
		}



		if (check) {
			// 렌즈컬러, 프레임컬러, 상품명, 카테고리가 일치하는 상품의 정보를 취득한다

			$.ajax({
				url: contextPath + "admin/addProduct.gm",
				data: {
					"productGroupId": $("select#productName > option:selected").val(),
					"lenseColor": $('#lenseColor > option:selected').val(),
					"category": $("input[name='category']:checked").val(),
					"frameColor": $('#frameColor > option:selected').val()
				},
				type: "get",
				async: true,
				dataType: "json",
				success: function(text) {

					if (text.isExist) {
						// 상품이 존재할 경우

						$("input:radio[name='category']:radio[value='" + text.categoryId + "']").prop('checked', true);

						$("input:radio[name='frame']").attr("disabled", true);
						$("input:radio[name='frame']:radio[value='" + text.frameId + "']").prop('checked', true);

						$("input:radio[name='material']").attr("disabled", true);
						$("input:radio[name='material']:radio[value='" + text.materialId + "']").prop('checked', true);

						$("input[name='price']").val(text.price).attr("disabled", true);

						$("input[name='silhouette']").val(text.silhouette).attr("disabled", true);
						$("input[name='detail']").val(text.detail).attr("disabled", true);
						$("input[name='templeLength']").val(text.templeLength).attr("disabled", true);
						$("input[name='lenseWidthSize']").val(text.lenseWidthSize).attr("disabled", true);
						$("input[name='lenseHeightSize']").val(text.lenseHeightSize).attr("disabled", true);
						$("input[name='frameSize']").val(text.frameSize).attr("disabled", true);
						$("input[name='bridge']").val(text.bridge).attr("disabled", true);


						$("input:radio[name='gender']:radio[value='" + text.gender + "']").prop('checked', true);
						$("input:radio[name='gender']").attr("disabled", true);

						$("input:radio[name='isMirror']:radio[value='" + text.isMirror + "']").prop('checked', true);
						$("input:radio[name='isMirror']").attr("disabled", true);

						$("input:radio[name='isTint']:radio[value='" + text.isTint + "']").prop('checked', true);
						$("input:radio[name='isTint']").attr("disabled", true);

						$("input:radio[name='isBlueLight']:radio[value='" + text.isBlueLight + "']").prop('checked', true);
						$("input:radio[name='isBlueLight']").attr("disabled", true);

						$("input:radio[name='isIndex']:radio[value='" + text.isIndex + "']").prop('checked', true);
						$("input:radio[name='isIndex']").attr("disabled", true);

						$("input:radio[name='isGift']:radio[value='" + text.isGift + "']").prop('checked', true);
						$("input:radio[name='isGift']").attr("disabled", true);

						$("textarea#description").val(text.description).attr("disabled", true);

						$("input[name='stock']").val(text.stock);

						$("input#mainImageFile").siblings("img.previewImg").attr("src", contextPath + text.mainImageFile.substr(1, text.mainImageFile.length));

						for (let i = 0; i < text.detailImageList.length; i++) {
							$("input#imageFile" + (i + 1)).siblings("img.previewImg").attr("src", contextPath + text.detailImageList[i]['imageFile' + (i + 1)].substr(1, text.detailImageList[i]['imageFile' + (i + 1)].length))
						}


						// mainImageFile의 존재 여부를 체크하기 위함 
						isExist = true;

					} else {
						// 상품이 존재하지 않을 경우

						$("input[name='gender']").prop('checked', false);
						$("input[name='gender']").attr("disabled", false);

						$("input[name='isMirror']").prop('checked', false);
						$("input[name='isMirror']").attr("disabled", false);

						$("input[name='isTint']").prop('checked', false);
						$("input[name='isTint']").attr("disabled", false);

						$("input[name='isBlueLight']").prop('checked', false);
						$("input[name='isBlueLight']").attr("disabled", false);

						$("input[name='isIndex']").prop('checked', false);
						$("input[name='isIndex']").attr("disabled", false);

						$("input[name='isGift']").prop('checked', false);
						$("input[name='isGift']").attr("disabled", false);

						$("textarea#description").val("").attr("disabled", false);

						$("input[name='stock']").val("");

						$("img.previewImg").attr("src", "");

						// mainImageFile의 존재 여부를 체크하기 위함 
						isExist = false;
					}
				},
				error: function(request, status, error) {
					alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
				}
			});
		}
	})


	
	/* 상품 등록 버튼을 눌렀을 경우 */
	$("button.addProductBtn").click(function() {
		// 상품을 등록하기 전 필수 입력 및 입력내용 체크용 변수 / true = 문제 없다 , false = 문제 있다
		let addCheck = true;

		// 상품종류 선택 여부
		if (!$("input:radio[name='category']").is(':checked')) {
			// 선택하지 않았다면
			$("input:radio[name='category']").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input:radio[name='category']").siblings("span.alert").hide();
		}


		// 상품명 선택 여부
		if ($("#productName").length == 1) {
			if ($('#productName > option:selected').val() == "") {
				// 선택하지 않았을 경우
				$('#productName').parent().append("<span class='alert'>상품을 선택해주세오</span>");
				addCheck = false;
			} else {
				$('#productName').siblings("span.alert").remove();
			}
		} else {
			// 상품명 입력으로 하였을 경우
			if ($("input#addProductNameInput").val().trim() == "") {
				// 아무것도 입력하지 않았을 경우
				$("input#addProductNameInput").parent().append("<span class='alert'>상품을 선택해주세오</span>");
				addCheck = false;
			} else {
				$("input#addProductNameInput").siblings("span.alert").remove();
			}
		}


		// 프레임컬러 선택 여부
		if ($('#frameColor > option:selected').val() == "") {
			// 선택하지 않았을 경우
			$('#frameColor').siblings("span.alert").show();
			addCheck = false;
		} else {
			$('#frameColor').siblings("span.alert").hide();
		}

		// 렌즈컬러 선택 여부
		if ($('#lenseColor > option:selected').val() == "") {
			// 선택하지 않았을 경우
			$('#lenseColor').siblings("span.alert").show();
			addCheck = false;
		} else {
			$('#lenseColor').siblings("span.alert").hide();
		}

		// 소재 선택 여부
		if (!$("input:radio[name='material']").is(':checked')) {
			// 선택하지 않았다면
			$("input:radio[name='material']").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input:radio[name='material']").siblings("span.alert").hide();
		}

		// 가격 입력 여부
		if ($("input#price").val().trim() == "") {
			// 아무것도 입력하지 않았을 경우
			$("input#price").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input#price").siblings("span.alert").hide();
		}

		// 프레임 선택 여부
		if (!$("input:radio[name='frame']").is(':checked')) {
			// 선택하지 않았다면
			$("input:radio[name='frame']").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input:radio[name='frame']").siblings("span.alert").hide();
		}

		// 실루엣 입력 여부
		if ($("input#silhouette").val().trim() == "") {
			// 아무것도 입력하지 않았을 경우
			$("input#silhouette").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input#silhouette").siblings("span.alert").hide();
		}

		// 디테일 입력 여부
		if ($("input#detail").val().trim() == "") {
			// 아무것도 입력하지 않았을 경우
			$("input#detail").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input#detail").siblings("span.alert").hide();
		}

		// 템플길이 입력 여부
		if ($("input#templeLength").val().trim() == "") {
			// 아무것도 입력하지 않았을 경우
			$("input#templeLength").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input#templeLength").siblings("span.alert").hide();
		}

		// 렌즈 가로 사이즈 입력 여부
		if ($("input#lenseWidthSize").val().trim() == "") {
			// 아무것도 입력하지 않았을 경우
			$("input#lenseWidthSize").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input#lenseWidthSize").siblings("span.alert").hide();
		}

		// 렌즈 높이 사이즈 입력 여부
		if ($("input#lenseHeightSize").val().trim() == "") {
			// 아무것도 입력하지 않았을 경우
			$("input#lenseHeightSize").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input#lenseHeightSize").siblings("span.alert").hide();
		}

		// 프레임 사이즈 입력 여부
		if ($("input#frameSize").val().trim() == "") {
			// 아무것도 입력하지 않았을 경우
			$("input#frameSize").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input#frameSize").siblings("span.alert").hide();
		}

		// 브릿지 입력 여부
		if ($("input#bridge").val().trim() == "") {
			// 아무것도 입력하지 않았을 경우
			$("input#bridge").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input#bridge").siblings("span.alert").hide();
		}

		// 젠더 선택 여부
		if (!$("input:radio[name='gender']").is(':checked')) {
			// 선택하지 않았다면
			$("input:radio[name='gender']").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input:radio[name='gender']").siblings("span.alert").hide();
		}

		// 미러 선택 여부
		if (!$("input:radio[name='isMirror']").is(':checked')) {
			// 선택하지 않았다면
			$("input:radio[name='isMirror']").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input:radio[name='isMirror']").siblings("span.alert").hide();
		}

		// 틴트 선택 여부
		if (!$("input:radio[name='isTint']").is(':checked')) {
			// 선택하지 않았다면
			$("input:radio[name='isTint']").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input:radio[name='isTint']").siblings("span.alert").hide();
		}

		// 블루라이트차단 선택 여부 _ 선글라스를 선택했을 경우 무로 고정 및 alert 수정필---------------------------------
		if (!$("input:radio[name='isBlueLight']").is(':checked')) {
			// 선택하지 않았다면
			$("input:radio[name='isBlueLight']").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input:radio[name='isBlueLight']").siblings("span.alert").hide();
		}

		// 인덱스 선택 여부
		if (!$("input:radio[name='isIndex']").is(':checked')) {
			// 선택하지 않았다면
			$("input:radio[name='isIndex']").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input:radio[name='isIndex']").siblings("span.alert").hide();
		}

		// 선물 추천 선택 여부
		if (!$("input:radio[name='isGift']").is(':checked')) {
			// 선택하지 않았다면
			$("input:radio[name='isGift']").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input:radio[name='isGift']").siblings("span.alert").hide();
		}

		// 소개 입력 여부
		if ($("textarea#description").val().trim() == "") {
			// 입력하지 않았다면
			$("textarea#description").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("textarea#description").siblings("span.alert").hide();
		}

		// 재고 입력 여부
		if ($("input#stock").val().trim() == "") {
			// 아무것도 입력하지 않았을 경우
			$("input#stock").siblings("span.alert").show();
			addCheck = false;
		} else {
			$("input#stock").siblings("span.alert").hide();
		}

		// 대표사진 첨부 여부
		if ($("input#mainImageFile").val() == "") {
			// 아무것도 입력하지 않았을 경우

			if (!isExist) {
				$("input#mainImageFile").siblings("span.alert").show();
				addCheck = false;
			}

		} else {
			$("input#mainImageFile").siblings("span.alert").hide();
		}

		if (addCheck) {
			// 체크 결과 문제 없을 경우
			
			$("input[type='radio']").attr("disabled", false);
			$("input[type='text']").each(function() {
				$(this).attr("disabled", false);
			})

			const pathname = "/" + window.location.pathname.split("/")[1] + "/";
			const origin = window.location.origin;
			const contextPath = origin + pathname;
			
			const frm = document.addProductFrm;
			frm.action = contextPath + `admin/addProduct.gm`;
			frm.method = "post";
			frm.submit();
		}
	})


	/* 제품이미지 또는 추가이미지 파일을 선택하면 화면에 이미지를 미리 보여주기 구현하기 */
	$(document).on("change", "input.imageFile", function(e) {

		let imageFile = $(this).parent();
		const input_file = $(e.target).get(0);

		const fileReader = new FileReader();

		fileReader.readAsDataURL(input_file.files[0]); //FileReader.readAsDataURL() --> 파일을 읽고, result속성에 파일을 나타내는 URL을 저장 시켜준다.
		fileReader.onload = function(event) { // FileReader.onload --> 파일 읽기 완료 성공시에만 작동하도록 하는 것임.
			imageFile.find("img.previewImg").attr("src", fileReader.result);
		};
	}); 
	/* end of 제품이미지 또는 추가이미지 파일을 선택하면 화면에 이미지를 미리 보여주기 구현하기 */
	
}); // end of $(document).ready(function(){}) ----------------------------------------------------------------------------------------------------------