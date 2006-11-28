<DOCFLEX_TEMPLATE VER='1.7'>
CREATED='2005-04-26 03:31:00'
LAST_UPDATE='2006-10-09 06:34:51'
DESIGNER_TOOL='DocFlex SDK 1.0'
TEMPLATE_TYPE='DocumentTemplate'
DSM_TYPE_ID='xsddoc'
ROOT_ETS={'xs:%complexType';'xs:%simpleType'}
<TEMPLATE_PARAMS>
	PARAM={
		param.name='page.refs';
		param.displayName='Generate page references';
		param.type='boolean';
		param.boolean.default='true';
	}
</TEMPLATE_PARAMS>
FMT={
	doc.lengthUnits='pt';
	doc.hlink.style.link='cs4';
}
<STYLES>
	CHAR_STYLE={
		style.name='Code';
		style.id='cs1';
		text.font.name='Courier New';
		text.font.size='9';
	}
	CHAR_STYLE={
		style.name='Default Paragraph Font';
		style.id='cs2';
		style.default='true';
	}
	CHAR_STYLE={
		style.name='Derivation Type Small';
		style.id='cs3';
		text.font.name='Verdana';
		text.font.size='7';
		text.color.foreground='#F59200';
	}
	CHAR_STYLE={
		style.name='Hyperlink';
		style.id='cs4';
		text.decor.underline='true';
		text.color.foreground='#0000FF';
	}
	PAR_STYLE={
		style.name='Inset Heading 2';
		style.id='s1';
		text.font.size='9';
		text.font.style.bold='true';
		text.color.foreground='#990000';
		par.margin.bottom='6.8';
		par.page.keepWithNext='true';
	}
	PAR_STYLE={
		style.name='Normal';
		style.id='s2';
		style.default='true';
	}
	CHAR_STYLE={
		style.name='Page Number Small';
		style.id='cs5';
		text.font.name='Courier New';
		text.font.size='8';
	}
</STYLES>
<ROOT>
	<ELEMENT_ITER>
		TARGET_ETS={'#STUB';'xs:complexType';'xs:simpleType';'xs:union'}
		SCOPE='advanced-location-rules'
		RULES={
			{'(xs:complexType|xs:simpleType)','.'};
			{'xs:%localComplexType','{el = StubXMLElement (null);\nel.setXMLAttribute("name", "complexType");\nEnum (el)}::*'};
			{'xs:%localSimpleType','{el = StubXMLElement (null);\nel.setXMLAttribute("name", "simpleType");\nEnum (el)}::*'};
			{'xs:%complexType','{(base = getValueByLPath ("(xs:simpleContent|xs:complexContent) / (xs:restriction|xs:extension)/@base").toString()) != "" ?\n{ \n  qName = QName (base);\n  ((el = findElementByKey ("types", qName)) == null) ?\n  {\n    el = StubXMLElement (null);\n    el.setXMLAttribute("name", qName.adaptQName (rootElement));\n  };\n  Enum (el)\n}}::(#STUB|xs:complexType|xs:simpleType)',recursive};
			{'xs:%simpleType','xs:restriction',recursive};
			{'xs:%simpleType','xs:list',recursive};
			{'xs:%simpleType','xs:union',recursive};
			{'xs:restriction','xs:simpleType',recursive};
			{'xs:restriction','{(base = getAttrStringValue("base")) != "" ? \n{ \n  qName = QName (base);\n  ((el = findElementByKey ("types", qName)) == null) ?\n  {\n    el = StubXMLElement (null);\n    el.setXMLAttribute("name", qName.adaptQName (rootElement));\n  };\n  Enum (el)\n}}::(#STUB|xs:simpleType)',recursive};
			{'xs:list','{(type = getAttrStringValue("itemType")) != "" ? \n{ \n  qName = QName (type);\n  ((el = findElementByKey ("types", qName)) == null) ?\n  {\n    el = StubXMLElement (null);\n    el.setXMLAttribute("name", qName.adaptQName (rootElement));\n  };\n  Enum (el)\n}}::(#STUB|xs:simpleType)',recursive};
			{'xs:list','xs:simpleType',recursive};
		}
		SORTING='reversed'
		<BODY>
			<FOLDER>
				DESCR='first item'
				COND='iterator.isFirstItem'
				FMT={
					text.style='cs1';
				}
				<BODY>
					<FOLDER>
						MATCHING_ET='#STUB'
						FMT={
							par.option.nowrap='true';
						}
						<BODY>
							<AREA_SEC>
								<AREA>
									<CTRL_GROUP>
										<CTRLS>
											<DATA_CTRL>
												FORMULA='getAttrValue("name")'
											</DATA_CTRL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</AREA_SEC>
						</BODY>
					</FOLDER>
					<SS_CALL>
						MATCHING_ET='xs:union'
						SS_NAME='union'
					</SS_CALL>
					<AREA_SEC>
						COND='sectionBlock.execSecNone'
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<SS_CALL_CTRL>
										<DOC_HLINK>
											TARGET_KEYS={
												'contextElement.id';
												'"detail"';
											}
										</DOC_HLINK>
										SS_NAME='QName'
									</SS_CALL_CTRL>
									<PANEL>
										COND='output.format.supportsPagination && \ngetBooleanParam("page.refs") &&\nhyperTargetExists (Array (contextElement.id,  "detail"))'
										FMT={
											ctrl.size.width='171';
											text.style='cs5';
											txtfl.delimiter.type='none';
										}
										<AREA>
											<CTRL_GROUP>
												<CTRLS>
													<DELIMITER>
													</DELIMITER>
													<LABEL>
														TEXT='['
													</LABEL>
													<DATA_CTRL>
														FMT={
															ctrl.option.noHLinkFmt='true';
															text.hlink.fmt='none';
														}
														<DOC_HLINK>
															TARGET_KEYS={
																'contextElement.id';
																'"detail"';
															}
														</DOC_HLINK>
														DOCFIELD='page-htarget'
													</DATA_CTRL>
													<LABEL>
														TEXT=']'
													</LABEL>
												</CTRLS>
											</CTRL_GROUP>
										</AREA>
									</PANEL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</BODY>
			</FOLDER>
			<AREA_SEC>
				COND='! iterator.isFirstItem && ! iterator.isLastItem'
				FMT={
					text.style='cs1';
					par.option.nowrap='true';
				}
				<AREA>
					<CTRL_GROUP>
						FMT={
							txtfl.delimiter.type='none';
						}
						<CTRLS>
							<DATA_CTRL>
								FMT={
									text.option.nbsps='true';
								}
								FORMULA='dup("  ", iterator.itemNo-2) + dup("  ", iterator.itemNo-1)'
							</DATA_CTRL>
							<IMAGE_CTRL>
								IMAGE_TYPE='file-image'
								FILE='../images/inherit.gif'
							</IMAGE_CTRL>
							<SS_CALL_CTRL>
								<DOC_HLINK>
									TARGET_KEYS={
										'contextElement.id';
										'"detail"';
									}
								</DOC_HLINK>
								SS_NAME='QName'
							</SS_CALL_CTRL>
							<PANEL>
								COND='output.format.supportsPagination && \ngetBooleanParam("page.refs") &&\nhyperTargetExists (Array (contextElement.id,  "detail"))'
								FMT={
									ctrl.size.width='171';
									text.style='cs5';
									txtfl.delimiter.type='none';
								}
								<AREA>
									<CTRL_GROUP>
										<CTRLS>
											<DELIMITER>
											</DELIMITER>
											<LABEL>
												TEXT='['
											</LABEL>
											<DATA_CTRL>
												FMT={
													ctrl.option.noHLinkFmt='true';
													text.hlink.fmt='none';
												}
												<DOC_HLINK>
													TARGET_KEYS={
														'contextElement.id';
														'"detail"';
													}
												</DOC_HLINK>
												DOCFIELD='page-htarget'
											</DATA_CTRL>
											<LABEL>
												TEXT=']'
											</LABEL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</PANEL>
							<DELIMITER>
							</DELIMITER>
							<SS_CALL_CTRL>
								FMT={
									text.style='cs3';
								}
								SS_NAME='Derivation'
							</SS_CALL_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
			<AREA_SEC>
				COND='iterator.isLastItem && ! iterator.isFirstItem'
				FMT={
					text.style='cs1';
					par.option.nowrap='true';
				}
				<AREA>
					<CTRL_GROUP>
						FMT={
							txtfl.delimiter.type='none';
							par.margin.bottom='0';
						}
						<CTRLS>
							<DATA_CTRL>
								FMT={
									text.option.nbsps='true';
								}
								FORMULA='dup("  ", iterator.itemNo-2) + dup("  ", iterator.itemNo-1)'
							</DATA_CTRL>
							<IMAGE_CTRL>
								IMAGE_TYPE='file-image'
								FILE='../images/inherit.gif'
							</IMAGE_CTRL>
							<SS_CALL_CTRL>
								FMT={
									text.style='cs1';
									text.font.style.bold='true';
								}
								SS_NAME='QName'
							</SS_CALL_CTRL>
							<DELIMITER>
							</DELIMITER>
							<SS_CALL_CTRL>
								FMT={
									text.style='cs3';
								}
								SS_NAME='Derivation'
							</SS_CALL_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
		</BODY>
		<HEADER>
			<AREA_SEC>
				FMT={
					par.style='s1';
				}
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<LABEL>
								TEXT='Type Derivation Tree'
							</LABEL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
		</HEADER>
	</ELEMENT_ITER>
</ROOT>
<STOCK_SECTIONS>
	<FOLDER>
		MATCHING_ETS={'xs:%complexType';'xs:%simpleType'}
		FMT={
			sec.outputStyle='text-par';
		}
		SS_NAME='Derivation'
		<BODY>
			<FOLDER>
				MATCHING_ET='xs:%complexType'
				<BODY>
					<AREA_SEC>
						CONTEXT_ELEMENT_EXPR='findChild ("xs:simpleContent | xs:complexContent")'
						MATCHING_ETS={'xs:complexContent';'xs:simpleContent'}
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<LABEL>
										COND='hasChild ("xs:restriction")'
										TEXT='restriction'
									</LABEL>
									<LABEL>
										COND='hasChild ("xs:extension")'
										TEXT='extension'
									</LABEL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</BODY>
			</FOLDER>
			<SS_CALL>
				MATCHING_ET='xs:%simpleType'
				SS_NAME='Derivation (of simpleType)'
			</SS_CALL>
		</BODY>
		<HEADER>
			<AREA_SEC>
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<LABEL>
								TEXT='('
							</LABEL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
		</HEADER>
		<FOOTER>
			<AREA_SEC>
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<LABEL>
								TEXT=')'
							</LABEL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
		</FOOTER>
	</FOLDER>
	<ELEMENT_ITER>
		MATCHING_ET='xs:%simpleType'
		FMT={
			sec.outputStyle='text-par';
			txtfl.delimiter.type='space';
		}
		TARGET_ETS={'xs:list';'xs:restriction'}
		SCOPE='simple-location-rules'
		RULES={
			{'*','(xs:list|xs:restriction)'};
		}
		SS_NAME='Derivation (of simpleType)'
		<BODY>
			<FOLDER>
				MATCHING_ET='xs:restriction'
				<BODY>
					<AREA_SEC>
						COND='getAttrStringValue("base") != ""'
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<LABEL>
										FMT={
											text.style='cs3';
										}
										TEXT='restriction'
									</LABEL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
					<AREA_SEC>
						COND='getAttrStringValue("base") == ""'
						<AREA>
							<CTRL_GROUP>
								FMT={
									txtfl.delimiter.type='none';
								}
								<CTRLS>
									<LABEL>
										FMT={
											text.style='cs3';
										}
										TEXT='restriction of '
									</LABEL>
									<SS_CALL_CTRL>
										SS_NAME='Derivation (of simpleType)'
										PASSED_ELEMENT_EXPR='findChild("xs:simpleType")'
										PASSED_ELEMENT_MATCHING_ET='xs:%localSimpleType'
									</SS_CALL_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</BODY>
			</FOLDER>
			<FOLDER>
				MATCHING_ET='xs:list'
				<BODY>
					<AREA_SEC>
						COND='getAttrStringValue("itemType") != ""'
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<LABEL>
										FMT={
											text.style='cs3';
										}
										TEXT='list'
									</LABEL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
					<AREA_SEC>
						COND='getAttrStringValue("itemType") == ""'
						<AREA>
							<CTRL_GROUP>
								FMT={
									txtfl.delimiter.type='none';
								}
								<CTRLS>
									<LABEL>
										FMT={
											text.style='cs3';
										}
										TEXT='list of '
									</LABEL>
									<SS_CALL_CTRL>
										SS_NAME='Derivation (of simpleType)'
										PASSED_ELEMENT_EXPR='findChild("xs:simpleType")'
										PASSED_ELEMENT_MATCHING_ET='xs:%localSimpleType'
									</SS_CALL_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</BODY>
			</FOLDER>
		</BODY>
	</ELEMENT_ITER>
	<AREA_SEC>
		SS_NAME='QName'
		<AREA>
			<CTRL_GROUP>
				FMT={
					txtfl.delimiter.type='none';
				}
				<CTRLS>
					<DATA_CTRL>
						FORMULA='QName (\n  getXMLDocument().getValueByLPath ("xs:schema/@targetNamespace").toString(),\n  getAttrStringValue("name"),\n  Enum (rootElement, contextElement)\n)'
					</DATA_CTRL>
				</CTRLS>
			</CTRL_GROUP>
		</AREA>
	</AREA_SEC>
	<ELEMENT_ITER>
		MATCHING_ET='xs:%simpleType'
		FMT={
			sec.outputStyle='text-par';
			txtfl.delimiter.type='space';
		}
		TARGET_ETS={'xs:list';'xs:restriction';'xs:union'}
		SCOPE='simple-location-rules'
		RULES={
			{'*','(xs:list|xs:restriction|xs:union)'};
		}
		SS_NAME='simpleType (within union)'
		<BODY>
			<FOLDER>
				MATCHING_ET='xs:restriction'
				<BODY>
					<AREA_SEC>
						COND='getAttrStringValue("base") != ""'
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<LABEL>
										FMT={
											text.style='cs3';
										}
										TEXT='restriction of'
									</LABEL>
									<DATA_CTRL>
										<DOC_HLINK>
											TARGET_KEYS={
												'findElementByKey ("types", getAttrQNameValue("base")).id';
												'"detail"';
											}
										</DOC_HLINK>
										ATTR='base'
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
					<AREA_SEC>
						COND='getAttrStringValue("base") == ""'
						<AREA>
							<CTRL_GROUP>
								FMT={
									txtfl.delimiter.type='none';
								}
								<CTRLS>
									<LABEL>
										FMT={
											text.style='cs3';
										}
										TEXT='restriction of '
									</LABEL>
									<SS_CALL_CTRL>
										SS_NAME='simpleType (within union)'
										PASSED_ELEMENT_EXPR='findChild("xs:simpleType")'
										PASSED_ELEMENT_MATCHING_ET='xs:%localSimpleType'
									</SS_CALL_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</BODY>
			</FOLDER>
			<FOLDER>
				MATCHING_ET='xs:list'
				<BODY>
					<AREA_SEC>
						COND='getAttrStringValue("itemType") != ""'
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<LABEL>
										FMT={
											text.style='cs3';
										}
										TEXT='list of'
									</LABEL>
									<DATA_CTRL>
										<DOC_HLINK>
											TARGET_KEYS={
												'findElementByKey ("types", getAttrQNameValue("itemType")).id';
												'"detail"';
											}
										</DOC_HLINK>
										ATTR='itemType'
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
					<AREA_SEC>
						COND='getAttrStringValue("itemType") == ""'
						<AREA>
							<CTRL_GROUP>
								FMT={
									txtfl.delimiter.type='none';
								}
								<CTRLS>
									<LABEL>
										FMT={
											text.style='cs3';
										}
										TEXT='list of '
									</LABEL>
									<SS_CALL_CTRL>
										SS_NAME='simpleType (within union)'
										PASSED_ELEMENT_EXPR='findChild("xs:simpleType")'
										PASSED_ELEMENT_MATCHING_ET='xs:%localSimpleType'
									</SS_CALL_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</BODY>
			</FOLDER>
			<SS_CALL>
				MATCHING_ET='xs:union'
				SS_NAME='union'
			</SS_CALL>
		</BODY>
	</ELEMENT_ITER>
	<FOLDER>
		MATCHING_ET='xs:union'
		FMT={
			sec.outputStyle='text-par';
			txtfl.delimiter.type='text';
			txtfl.delimiter.text=' | ';
		}
		SS_NAME='union'
		<BODY>
			<ATTR_ITER>
				SCOPE='attr-values'
				ATTR='memberTypes'
				<BODY>
					<AREA_SEC>
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<DATA_CTRL>
										<DOC_HLINK>
											TARGET_KEYS={
												'findElementByKey ("types", toQName (iterator.value)).id';
												'"detail"';
											}
										</DOC_HLINK>
										FORMULA='iterator.value'
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</BODY>
			</ATTR_ITER>
			<ELEMENT_ITER>
				TARGET_ET='xs:%localSimpleType'
				SCOPE='simple-location-rules'
				RULES={
					{'*','xs:simpleType'};
				}
				<BODY>
					<SS_CALL>
						SS_NAME='simpleType (within union)'
					</SS_CALL>
				</BODY>
			</ELEMENT_ITER>
		</BODY>
		<HEADER>
			<AREA_SEC>
				<AREA>
					<CTRL_GROUP>
						FMT={
							txtfl.delimiter.type='space';
						}
						<CTRLS>
							<LABEL>
								FMT={
									text.style='cs3';
								}
								TEXT='union of'
							</LABEL>
							<LABEL>
								TEXT='('
							</LABEL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
		</HEADER>
		<FOOTER>
			<AREA_SEC>
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<LABEL>
								TEXT=')'
							</LABEL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
		</FOOTER>
	</FOLDER>
</STOCK_SECTIONS>
CHECKSUM='ULI4e5UFMcLMzaDRi7kdEw'
</DOCFLEX_TEMPLATE>