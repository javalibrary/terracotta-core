<DOCFLEX_TEMPLATE VER='1.7'>
CREATED='2004-06-21 01:50:00'
LAST_UPDATE='2006-10-09 06:34:51'
DESIGNER_TOOL='DocFlex SDK 1.0'
TEMPLATE_TYPE='DocumentTemplate'
DSM_TYPE_ID='xsddoc'
ROOT_ET='xs:schema'
<TEMPLATE_PARAMS>
	PARAM={
		param.name='schema-summary';
		param.type='boolean';
		param.hidden='true';
	}
</TEMPLATE_PARAMS>
<HTARGET>
	TARGET_KEYS={
		'"overview-summary"';
	}
</HTARGET>
FMT={
	doc.lengthUnits='pt';
	doc.hlink.style.link='cs3';
}
<STYLES>
	CHAR_STYLE={
		style.name='Code Smaller';
		style.id='cs1';
		text.font.name='Courier New';
		text.font.size='8';
	}
	CHAR_STYLE={
		style.name='Default Paragraph Font';
		style.id='cs2';
		style.default='true';
	}
	CHAR_STYLE={
		style.name='Hyperlink';
		style.id='cs3';
		text.decor.underline='true';
		text.color.foreground='#0000FF';
	}
	PAR_STYLE={
		style.name='Normal';
		style.id='s1';
		style.default='true';
	}
	CHAR_STYLE={
		style.name='Normal Smaller';
		style.id='cs4';
		text.font.name='Arial';
		text.font.size='9';
	}
	PAR_STYLE={
		style.name='Profile Subheading';
		style.id='s2';
		text.font.name='Arial';
		text.font.size='9';
		text.font.style.bold='true';
		par.margin.top='6';
	}
	CHAR_STYLE={
		style.name='Property Text';
		style.id='cs5';
		text.font.name='Verdana';
		text.font.size='8';
		par.lineHeight='11';
	}
</STYLES>
<ROOT>
	<AREA_SEC>
		DESCR='Target Namespace'
		<AREA>
			<CTRL_GROUP>
				FMT={
					txtfl.delimiter.type='none';
					par.style='s2';
					par.margin.top='0';
				}
				<CTRLS>
					<LABEL>
						TEXT='Target Namespace:'
					</LABEL>
				</CTRLS>
			</CTRL_GROUP>
			<CTRL_GROUP>
				FMT={
					row.indent.block='true';
				}
				<CTRLS>
					<DATA_CTRL>
						FMT={
							text.style='cs1';
						}
						<DOC_HLINK>
							TARGET_KEYS={
								'getAttrStringValue("targetNamespace")';
								'"detail"';
							}
						</DOC_HLINK>
						FORMULA='(ns = getAttrStringValue("targetNamespace")) != "" ? ns : "<global>"'
					</DATA_CTRL>
				</CTRLS>
			</CTRL_GROUP>
		</AREA>
	</AREA_SEC>
	<FOLDER>
		DESCR='Schema Components'
		COLLAPSED
		<BODY>
			<AREA_SEC>
				FMT={
					sec.outputStyle='text-par';
					sec.indent.block='true';
					text.style='cs4';
					txtfl.delimiter.type='text';
					txtfl.delimiter.text=', ';
				}
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<PANEL>
								COND='count = countChildren ("xs:element");\n\ncount > 0 ? { setVar ("count", count); true } : false'
								FMT={
									ctrl.size.width='196.5';
									text.option.nbsps='true';
									txtfl.delimiter.type='nbsp';
								}
								<AREA>
									<CTRL_GROUP>
										<CTRLS>
											<DATA_CTRL>
												FORMULA='getVar("count")'
											</DATA_CTRL>
											<LABEL>
												COND='getVar("count").toInt() == 1'
												FMT={
													text.option.nbsps='true';
												}
												<DOC_HLINK>
													TARGET_KEYS={
														'contextElement.id';
														'"global-element-summary"';
													}
												</DOC_HLINK>
												TEXT='global element'
											</LABEL>
											<LABEL>
												COND='getVar("count").toInt() > 1'
												FMT={
													text.option.nbsps='true';
												}
												<DOC_HLINK>
													TARGET_KEYS={
														'contextElement.id';
														'"global-element-summary"';
													}
												</DOC_HLINK>
												TEXT='global elements'
											</LABEL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</PANEL>
							<PANEL>
								COND='e = findElementsByLPath(\n  \'descendant::xs:%localElement [getAttrValue("ref") == ""]\'\n);\n\ne = filterElementsByKey (e, FlexQuery ({\n  (type = getAttrStringValue("type")) != "" ? \n     HashKey (getAttrValue("name"), QName(type)) : contextElement.id\n}));\n\ncount = count (e);\n\ncount > 0 ? { setVar ("count", count); true } : false'
								FMT={
									ctrl.size.width='189';
									text.option.nbsps='true';
									txtfl.delimiter.type='nbsp';
								}
								<AREA>
									<CTRL_GROUP>
										<CTRLS>
											<DATA_CTRL>
												FORMULA='getVar("count")'
											</DATA_CTRL>
											<LABEL>
												COND='getVar("count").toInt() == 1'
												FMT={
													text.option.nbsps='true';
												}
												<DOC_HLINK>
													TARGET_KEYS={
														'contextElement.id';
														'"local-element-summary"';
													}
												</DOC_HLINK>
												TEXT='local element'
											</LABEL>
											<LABEL>
												COND='getVar("count").toInt() > 1'
												FMT={
													text.option.nbsps='true';
												}
												<DOC_HLINK>
													TARGET_KEYS={
														'contextElement.id';
														'"local-element-summary"';
													}
												</DOC_HLINK>
												TEXT='local elements'
											</LABEL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</PANEL>
							<PANEL>
								COND='count = countElementsByLPath ("descendant::xs:complexType");\n\ncount > 0 ? { setVar ("count", count); true } : false'
								FMT={
									ctrl.size.width='189';
									text.option.nbsps='true';
									txtfl.delimiter.type='nbsp';
								}
								<AREA>
									<CTRL_GROUP>
										<CTRLS>
											<DATA_CTRL>
												FORMULA='getVar("count")'
											</DATA_CTRL>
											<LABEL>
												COND='getVar("count").toInt() == 1'
												<DOC_HLINK>
													TARGET_KEYS={
														'contextElement.id';
														'"complexType-summary"';
													}
												</DOC_HLINK>
												TEXT='complexType'
											</LABEL>
											<LABEL>
												COND='getVar("count").toInt() > 1'
												<DOC_HLINK>
													TARGET_KEYS={
														'contextElement.id';
														'"complexType-summary"';
													}
												</DOC_HLINK>
												TEXT='complexTypes'
											</LABEL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</PANEL>
							<PANEL>
								COND='count = countElementsByLPath ("descendant::xs:simpleType");\n\ncount > 0 ? { setVar ("count", count); true } : false'
								FMT={
									ctrl.size.width='176.3';
									text.option.nbsps='true';
									txtfl.delimiter.type='nbsp';
								}
								<AREA>
									<CTRL_GROUP>
										<CTRLS>
											<DATA_CTRL>
												FORMULA='getVar("count")'
											</DATA_CTRL>
											<LABEL>
												COND='getVar("count").toInt() == 1'
												<DOC_HLINK>
													TARGET_KEYS={
														'contextElement.id';
														'"simpleType-summary"';
													}
												</DOC_HLINK>
												TEXT='simpleType'
											</LABEL>
											<LABEL>
												COND='getVar("count").toInt() > 1'
												<DOC_HLINK>
													TARGET_KEYS={
														'contextElement.id';
														'"simpleType-summary"';
													}
												</DOC_HLINK>
												TEXT='simpleTypes'
											</LABEL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</PANEL>
							<PANEL>
								COND='count = countElementsByLPath ("descendant::xs:group");\n\ncount > 0 ? { setVar ("count", count); true } : false'
								FMT={
									ctrl.size.width='192';
									text.option.nbsps='true';
									txtfl.delimiter.type='nbsp';
								}
								<AREA>
									<CTRL_GROUP>
										<CTRLS>
											<DATA_CTRL>
												FORMULA='getVar("count")'
											</DATA_CTRL>
											<LABEL>
												COND='getVar("count").toInt() == 1'
												<DOC_HLINK>
													TARGET_KEYS={
														'contextElement.id';
														'"group-summary"';
													}
												</DOC_HLINK>
												TEXT='element group'
											</LABEL>
											<LABEL>
												COND='getVar("count").toInt() > 1'
												<DOC_HLINK>
													TARGET_KEYS={
														'contextElement.id';
														'"group-summary"';
													}
												</DOC_HLINK>
												TEXT='element groups'
											</LABEL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</PANEL>
							<PANEL>
								COND='count = countChildren ("xs:attribute");\n\ncount > 0 ? { setVar ("count", count); true } : false'
								FMT={
									ctrl.size.width='194.3';
									text.option.nbsps='true';
									txtfl.delimiter.type='nbsp';
								}
								<AREA>
									<CTRL_GROUP>
										<CTRLS>
											<DATA_CTRL>
												FORMULA='getVar("count")'
											</DATA_CTRL>
											<LABEL>
												COND='getVar("count").toInt() == 1'
												<DOC_HLINK>
													TARGET_KEYS={
														'contextElement.id';
														'"attribute-summary"';
													}
												</DOC_HLINK>
												TEXT='global attribute'
											</LABEL>
											<LABEL>
												COND='getVar("count").toInt() > 1'
												<DOC_HLINK>
													TARGET_KEYS={
														'contextElement.id';
														'"attribute-summary"';
													}
												</DOC_HLINK>
												TEXT='global attributes'
											</LABEL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</PANEL>
							<PANEL>
								COND='count = countElementsByLPath ("descendant::xs:attributeGroup");\n\ncount > 0 ? { setVar ("count", count); true } : false'
								FMT={
									ctrl.size.width='192.8';
									text.option.nbsps='true';
									txtfl.delimiter.type='nbsp';
								}
								<AREA>
									<CTRL_GROUP>
										<CTRLS>
											<DATA_CTRL>
												FORMULA='getVar("count")'
											</DATA_CTRL>
											<LABEL>
												COND='getVar("count").toInt() == 1'
												<DOC_HLINK>
													TARGET_KEYS={
														'contextElement.id';
														'"attributeGroup-summary"';
													}
												</DOC_HLINK>
												TEXT='attribute group'
											</LABEL>
											<LABEL>
												COND='getVar("count").toInt() > 1'
												<DOC_HLINK>
													TARGET_KEYS={
														'contextElement.id';
														'"attributeGroup-summary"';
													}
												</DOC_HLINK>
												TEXT='attribute groups'
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
		<HEADER>
			<AREA_SEC>
				FMT={
					par.style='s2';
				}
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<LABEL>
								TEXT='Components:'
							</LABEL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
		</HEADER>
	</FOLDER>
	<AREA_SEC>
		DESCR='Schema Location'
		<AREA>
			<CTRL_GROUP>
				FMT={
					txtfl.delimiter.type='none';
					par.style='s2';
				}
				<CTRLS>
					<LABEL>
						TEXT='Schema Location:'
					</LABEL>
				</CTRLS>
			</CTRL_GROUP>
			<CTRL_GROUP>
				FMT={
					row.indent.block='true';
					text.style='cs5';
				}
				<CTRLS>
					<DATA_CTRL>
						CONTEXT_ELEMENT_EXPR='getXMLDocument()'
						MATCHING_ET='#DOCUMENT'
						FMT={
							ctrl.size.width='324';
							ctrl.size.height='17.3';
						}
						<URL_HLINK>
							COND='uri = getAttrStringValue("xmlURI");\nspec = makeRelativePath (uri, mainContext.output.dir);\nuri != spec && ! spec.startsWith(\'..\')'
							TARGET_FRAME_EXPR='"_blank"'
							URL_EXPR='makeRelativePath (\n  getAttrStringValue("xmlURI"),\n  output.dir\n)'
						</URL_HLINK>
						<URL_HLINK>
							COND='! isLocalFile (getAttrStringValue("xmlURI"))'
							TARGET_FRAME_EXPR='"_blank"'
							URL_EXPR='getAttrStringValue("xmlURI")'
						</URL_HLINK>
						FORMULA='uri = getAttrStringValue("xmlURI");\nspec = makeRelativePath (uri, mainContext.output.dir);\nuri != spec && ! spec.startsWith(\'..\') ? spec : uri'
					</DATA_CTRL>
					<PANEL>
						COND='hyperTargetExists (Array (contextElement.id, "xml-source"))'
						FMT={
							ctrl.size.width='105';
						}
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<DELIMITER>
										FMT={
											txtfl.delimiter.type='text';
											txtfl.delimiter.text=', ';
										}
									</DELIMITER>
									<LABEL>
										TEXT='see'
									</LABEL>
									<LABEL>
										<DOC_HLINK>
											TARGET_KEYS={
												'contextElement.id';
												'"xml-source"';
											}
										</DOC_HLINK>
										TEXT='XML source'
									</LABEL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</PANEL>
				</CTRLS>
			</CTRL_GROUP>
		</AREA>
	</AREA_SEC>
	<FOLDER>
		DESCR='Related Schemas'
		<BODY>
			<ELEMENT_ITER>
				DESCR='imports schemas'
				FMT={
					sec.outputStyle='list';
					text.style='cs4';
					list.type='delimited';
					list.margin.block='true';
				}
				TARGET_ET='xs:import'
				SCOPE='simple-location-rules'
				RULES={
					{'*','xs:import'};
				}
				FILTER='checkElementsByKey ("loaded-schema", contextElement.id)'
				SORTING='by-expr'
				SORTING_KEY={expr='schema = findElementByKey ("loaded-schema", contextElement.id);\nschema.getXMLDocument().getAttrStringValue("xmlName")',ascending}
				COLLAPSED
				<BODY>
					<AREA_SEC>
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<DATA_CTRL>
										CONTEXT_ELEMENT_EXPR='findElementByKey (\n  "loaded-schema", contextElement.id\n).getXMLDocument()'
										MATCHING_ET='#DOCUMENT'
										<DOC_HLINK>
											TARGET_KEYS={
												'contextElement.id';
												'"detail"';
											}
										</DOC_HLINK>
										ATTR='xmlName'
									</DATA_CTRL>
									<PANEL>
										COND='getBooleanParam("schema-summary") &&\n! output.format.supportsPagination &&\nhyperTargetExists (Array (contextElement.id, "src"))'
										FMT={
											ctrl.size.width='101.3';
											ctrl.size.height='38.3';
											txtfl.delimiter.type='none';
										}
										<AREA>
											<CTRL_GROUP>
												<CTRLS>
													<DELIMITER>
														FMT={
															txtfl.delimiter.type='nbsp';
														}
													</DELIMITER>
													<LABEL>
														TEXT='['
													</LABEL>
													<LABEL>
														<DOC_HLINK>
															TARGET_KEYS={
																'contextElement.id';
																'"src"';
															}
														</DOC_HLINK>
														TEXT='src'
													</LABEL>
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
				<HEADER>
					<AREA_SEC>
						FMT={
							par.style='s2';
						}
						<AREA>
							<CTRL_GROUP>
								FMT={
									txtfl.delimiter.type='none';
								}
								<CTRLS>
									<DATA_CTRL>
										FORMULA='iterator.numItems > 1? \n  "Imports Schemas (" + iterator.numItems + "):" : "Imports Schema:"'
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</HEADER>
			</ELEMENT_ITER>
			<ELEMENT_ITER>
				DESCR='includes schemas'
				FMT={
					sec.outputStyle='list';
					text.style='cs4';
					list.type='delimited';
					list.margin.block='true';
				}
				TARGET_ET='xs:include'
				SCOPE='simple-location-rules'
				RULES={
					{'*','xs:include'};
				}
				FILTER='checkElementsByKey ("loaded-schema", contextElement.id)'
				SORTING='by-expr'
				SORTING_KEY={expr='schema = findElementByKey ("loaded-schema", contextElement.id);\nschema.getXMLDocument().getAttrStringValue("xmlName")',ascending}
				COLLAPSED
				<BODY>
					<AREA_SEC>
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<DATA_CTRL>
										CONTEXT_ELEMENT_EXPR='findElementByKey (\n  "loaded-schema", contextElement.id\n).getXMLDocument()'
										MATCHING_ET='#DOCUMENT'
										<DOC_HLINK>
											TARGET_KEYS={
												'contextElement.id';
												'"detail"';
											}
										</DOC_HLINK>
										ATTR='xmlName'
									</DATA_CTRL>
									<PANEL>
										COND='getBooleanParam("schema-summary") &&\n! output.format.supportsPagination &&\nhyperTargetExists (Array (contextElement.id, "src"))'
										FMT={
											ctrl.size.width='101.3';
											ctrl.size.height='38.3';
											txtfl.delimiter.type='none';
										}
										<AREA>
											<CTRL_GROUP>
												<CTRLS>
													<DELIMITER>
														FMT={
															txtfl.delimiter.type='nbsp';
														}
													</DELIMITER>
													<LABEL>
														TEXT='['
													</LABEL>
													<LABEL>
														<DOC_HLINK>
															TARGET_KEYS={
																'contextElement.id';
																'"src"';
															}
														</DOC_HLINK>
														TEXT='src'
													</LABEL>
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
				<HEADER>
					<AREA_SEC>
						FMT={
							par.style='s2';
						}
						<AREA>
							<CTRL_GROUP>
								FMT={
									txtfl.delimiter.type='none';
								}
								<CTRLS>
									<DATA_CTRL>
										FORMULA='iterator.numItems > 1 ? \n  "Includes Schemas (" + iterator.numItems + "):" : "Includes Schema:"'
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</HEADER>
			</ELEMENT_ITER>
			<ELEMENT_ITER>
				DESCR='redefines schemas'
				FMT={
					sec.outputStyle='list';
					text.style='cs4';
					list.type='delimited';
					list.margin.block='true';
				}
				TARGET_ET='xs:redefine'
				SCOPE='simple-location-rules'
				RULES={
					{'*','xs:redefine'};
				}
				FILTER='checkElementsByKey ("loaded-schema", contextElement.id)'
				SORTING='by-expr'
				SORTING_KEY={expr='schema = findElementByKey ("loaded-schema", contextElement.id);\nschema.getXMLDocument().getAttrStringValue("xmlName")',ascending}
				COLLAPSED
				<BODY>
					<AREA_SEC>
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<DATA_CTRL>
										CONTEXT_ELEMENT_EXPR='findElementByKey (\n  "loaded-schema", contextElement.id\n).getXMLDocument()'
										MATCHING_ET='#DOCUMENT'
										<DOC_HLINK>
											TARGET_KEYS={
												'contextElement.id';
												'"detail"';
											}
										</DOC_HLINK>
										ATTR='xmlName'
									</DATA_CTRL>
									<PANEL>
										COND='getBooleanParam("schema-summary") &&\n! output.format.supportsPagination &&\nhyperTargetExists (Array (contextElement.id, "src"))'
										FMT={
											ctrl.size.width='101.3';
											ctrl.size.height='38.3';
											txtfl.delimiter.type='none';
										}
										<AREA>
											<CTRL_GROUP>
												<CTRLS>
													<DELIMITER>
														FMT={
															txtfl.delimiter.type='nbsp';
														}
													</DELIMITER>
													<LABEL>
														TEXT='['
													</LABEL>
													<LABEL>
														<DOC_HLINK>
															TARGET_KEYS={
																'contextElement.id';
																'"src"';
															}
														</DOC_HLINK>
														TEXT='src'
													</LABEL>
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
				<HEADER>
					<AREA_SEC>
						FMT={
							par.style='s2';
						}
						<AREA>
							<CTRL_GROUP>
								FMT={
									txtfl.delimiter.type='none';
								}
								<CTRLS>
									<DATA_CTRL>
										FORMULA='iterator.numItems > 1 ? \n  "Redefines Schemas (" + iterator.numItems + "):" : "Redefines Schema"'
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</HEADER>
			</ELEMENT_ITER>
			<ELEMENT_ITER>
				DESCR='imported by schemas'
				FMT={
					sec.outputStyle='list';
					text.style='cs4';
					list.type='delimited';
					list.margin.block='true';
				}
				TARGET_ET='xs:import'
				SCOPE='custom'
				ELEMENT_ENUM_EXPR='findElementsByKey ("schema-loading-elements", contextElement.id)'
				SORTING='by-expr'
				SORTING_KEY={expr='getXMLDocument().getAttrStringValue("xmlName")',ascending}
				COLLAPSED
				<BODY>
					<AREA_SEC>
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<DATA_CTRL>
										CONTEXT_ELEMENT_EXPR='getXMLDocument()'
										MATCHING_ET='#DOCUMENT'
										<DOC_HLINK>
											TARGET_KEYS={
												'contextElement.id';
												'"detail"';
											}
										</DOC_HLINK>
										ATTR='xmlName'
									</DATA_CTRL>
									<PANEL>
										COND='getBooleanParam("schema-summary") &&\n! output.format.supportsPagination &&\nhyperTargetExists (Array (contextElement.id, "src"))'
										FMT={
											ctrl.size.width='101.3';
											ctrl.size.height='38.3';
											txtfl.delimiter.type='none';
										}
										<AREA>
											<CTRL_GROUP>
												<CTRLS>
													<DELIMITER>
														FMT={
															txtfl.delimiter.type='nbsp';
														}
													</DELIMITER>
													<LABEL>
														TEXT='['
													</LABEL>
													<LABEL>
														<DOC_HLINK>
															TARGET_KEYS={
																'contextElement.id';
																'"src"';
															}
														</DOC_HLINK>
														TEXT='src'
													</LABEL>
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
				<HEADER>
					<AREA_SEC>
						FMT={
							par.style='s2';
						}
						<AREA>
							<CTRL_GROUP>
								FMT={
									txtfl.delimiter.type='none';
								}
								<CTRLS>
									<DATA_CTRL>
										FORMULA='iterator.numItems > 1 ? \n  "Imported by Schemas (" + iterator.numItems + "):" : "Imported by Schema:"'
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</HEADER>
			</ELEMENT_ITER>
			<ELEMENT_ITER>
				DESCR='included in schemas'
				FMT={
					sec.outputStyle='list';
					text.style='cs4';
					list.type='delimited';
					list.margin.block='true';
				}
				TARGET_ET='xs:include'
				SCOPE='custom'
				ELEMENT_ENUM_EXPR='findElementsByKey ("schema-loading-elements", contextElement.id)'
				SORTING='by-expr'
				SORTING_KEY={expr='getXMLDocument().getAttrStringValue("xmlName")',ascending}
				COLLAPSED
				<BODY>
					<AREA_SEC>
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<DATA_CTRL>
										CONTEXT_ELEMENT_EXPR='getXMLDocument()'
										MATCHING_ET='#DOCUMENT'
										<DOC_HLINK>
											TARGET_KEYS={
												'contextElement.id';
												'"detail"';
											}
										</DOC_HLINK>
										ATTR='xmlName'
									</DATA_CTRL>
									<PANEL>
										COND='getBooleanParam("schema-summary") &&\n! output.format.supportsPagination &&\nhyperTargetExists (Array (contextElement.id, "src"))'
										FMT={
											ctrl.size.width='101.3';
											ctrl.size.height='38.3';
											txtfl.delimiter.type='none';
										}
										<AREA>
											<CTRL_GROUP>
												<CTRLS>
													<DELIMITER>
														FMT={
															txtfl.delimiter.type='nbsp';
														}
													</DELIMITER>
													<LABEL>
														TEXT='['
													</LABEL>
													<LABEL>
														<DOC_HLINK>
															TARGET_KEYS={
																'contextElement.id';
																'"src"';
															}
														</DOC_HLINK>
														TEXT='src'
													</LABEL>
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
				<HEADER>
					<AREA_SEC>
						FMT={
							par.style='s2';
						}
						<AREA>
							<CTRL_GROUP>
								FMT={
									txtfl.delimiter.type='none';
								}
								<CTRLS>
									<DATA_CTRL>
										FORMULA='iterator.numItems > 1 ? \n  "Included in Schemas (" + iterator.numItems + "):" : "Included in Schema:"'
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</HEADER>
			</ELEMENT_ITER>
			<ELEMENT_ITER>
				DESCR='redefined in schemas'
				FMT={
					sec.outputStyle='list';
					text.style='cs4';
					list.type='delimited';
					list.margin.block='true';
				}
				TARGET_ET='xs:redefine'
				SCOPE='custom'
				ELEMENT_ENUM_EXPR='findElementsByKey ("schema-loading-elements", contextElement.id)'
				SORTING='by-expr'
				SORTING_KEY={expr='getXMLDocument().getAttrStringValue("xmlName")',ascending}
				COLLAPSED
				<BODY>
					<AREA_SEC>
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<DATA_CTRL>
										CONTEXT_ELEMENT_EXPR='getXMLDocument()'
										MATCHING_ET='#DOCUMENT'
										<DOC_HLINK>
											TARGET_KEYS={
												'contextElement.id';
												'"detail"';
											}
										</DOC_HLINK>
										ATTR='xmlName'
									</DATA_CTRL>
									<PANEL>
										COND='getBooleanParam("schema-summary") &&\n! output.format.supportsPagination &&\nhyperTargetExists (Array (contextElement.id, "src"))'
										FMT={
											ctrl.size.width='101.3';
											ctrl.size.height='38.3';
											txtfl.delimiter.type='none';
										}
										<AREA>
											<CTRL_GROUP>
												<CTRLS>
													<DELIMITER>
														FMT={
															txtfl.delimiter.type='nbsp';
														}
													</DELIMITER>
													<LABEL>
														TEXT='['
													</LABEL>
													<LABEL>
														<DOC_HLINK>
															TARGET_KEYS={
																'contextElement.id';
																'"src"';
															}
														</DOC_HLINK>
														TEXT='src'
													</LABEL>
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
				<HEADER>
					<AREA_SEC>
						FMT={
							par.style='s2';
						}
						<AREA>
							<CTRL_GROUP>
								FMT={
									txtfl.delimiter.type='none';
								}
								<CTRLS>
									<DATA_CTRL>
										FORMULA='iterator.numItems > 1 ? \n  "Redefined in Schemas (" + iterator.numItems + "):" : "Redefined in Schema:"'
									</DATA_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</HEADER>
			</ELEMENT_ITER>
		</BODY>
	</FOLDER>
</ROOT>
CHECKSUM='SNn1LNi?mFjI9S4mbjBOGw'
</DOCFLEX_TEMPLATE>