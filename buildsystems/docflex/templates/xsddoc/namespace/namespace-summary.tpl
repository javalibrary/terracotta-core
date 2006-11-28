<DOCFLEX_TEMPLATE VER='1.7'>
CREATED='2004-06-21 01:50:00'
LAST_UPDATE='2006-10-09 06:34:51'
DESIGNER_TOOL='DocFlex SDK 1.0'
TEMPLATE_TYPE='DocumentTemplate'
DSM_TYPE_ID='xsddoc'
ROOT_ET='#DOCUMENTS'
<TEMPLATE_PARAMS>
	PARAM={
		param.name='nsURI';
		param.displayName='Namespace URI';
		param.type='string';
	}
	PARAM={
		param.name='doc.namespace.profile';
		param.displayName='Namespace Profile';
		param.type='boolean';
		param.boolean.default='true';
	}
	PARAM={
		param.name='doc.namespace.cs.element';
		param.displayName='Element Summary';
		param.type='enum';
		param.enum.values='all\nglobal\nlocal\nglobal_local\nnone';
	}
	PARAM={
		param.name='doc.namespace.cs.complexType';
		param.displayName='Complex Type Summary';
		param.type='boolean';
		param.boolean.default='true';
	}
	PARAM={
		param.name='doc.namespace.cs.simpleType';
		param.displayName='Simple Type Summary';
		param.type='boolean';
		param.boolean.default='true';
	}
	PARAM={
		param.name='doc.namespace.cs.group';
		param.displayName='Element Group Summary';
		param.type='boolean';
		param.boolean.default='true';
	}
	PARAM={
		param.name='doc.namespace.cs.attribute';
		param.displayName='Global Attribute Summary';
		param.type='boolean';
		param.boolean.default='true';
	}
	PARAM={
		param.name='doc.namespace.cs.attributeGroup';
		param.displayName='Attribute Group Summary';
		param.type='boolean';
		param.boolean.default='true';
	}
</TEMPLATE_PARAMS>
<HTARGET>
	TARGET_KEYS={
		'getStringParam("nsURI")';
		'"detail"';
	}
</HTARGET>
FMT={
	doc.lengthUnits='pt';
	doc.hlink.style.link='cs3';
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
		style.name='Hyperlink';
		style.id='cs3';
		text.decor.underline='true';
		text.color.foreground='#0000FF';
	}
	PAR_STYLE={
		style.name='Main Heading';
		style.id='s1';
		text.font.name='Verdana';
		text.font.size='13';
		text.font.style.bold='true';
		text.color.foreground='#4477AA';
		par.bkgr.opaque='true';
		par.bkgr.color='#EEEEEE';
		par.border.style='solid';
		par.border.color='#4477AA';
		par.margin.top='0';
		par.margin.bottom='9';
		par.padding.left='5';
		par.padding.right='5';
		par.padding.top='3';
		par.padding.bottom='3';
		par.page.keepTogether='true';
		par.page.keepWithNext='true';
	}
	PAR_STYLE={
		style.name='Normal';
		style.id='s2';
		style.default='true';
	}
	CHAR_STYLE={
		style.name='Normal Smaller';
		style.id='cs4';
		text.font.name='Arial';
		text.font.size='9';
	}
	CHAR_STYLE={
		style.name='Page Header Font';
		style.id='cs5';
		text.font.name='Arial';
		text.font.style.italic='true';
	}
	CHAR_STYLE={
		style.name='Page Number';
		style.id='cs6';
		text.font.size='9';
	}
	CHAR_STYLE={
		style.name='Summary Heading Font';
		style.id='cs7';
		text.font.size='12';
		text.font.style.bold='true';
	}
</STYLES>
<PAGE_HEADER>
	<AREA_SEC>
		FMT={
			text.style='cs5';
			table.cellpadding.both='0';
			table.border.style='none';
			table.border.bottom.style='solid';
		}
		<AREA>
			<CTRL_GROUP>
				FMT={
					par.border.bottom.style='solid';
				}
				<CTRLS>
					<LABEL>
						TEXT='Namespace'
					</LABEL>
					<DATA_CTRL>
						FORMULA='(ns = getStringParam("nsURI")) != "" ? \'"\' + ns + \'"\' : "<global>"'
					</DATA_CTRL>
				</CTRLS>
			</CTRL_GROUP>
		</AREA>
	</AREA_SEC>
</PAGE_HEADER>
<ROOT>
	<AREA_SEC>
		COND='getStringParam("nsURI") == ""'
		FMT={
			par.style='s1';
		}
		<AREA>
			<CTRL_GROUP>
				<CTRLS>
					<LABEL>
						TEXT='Global Namespace'
					</LABEL>
				</CTRLS>
			</CTRL_GROUP>
		</AREA>
	</AREA_SEC>
	<AREA_SEC>
		COND='getStringParam("nsURI") != ""'
		FMT={
			par.style='s1';
		}
		<AREA>
			<CTRL_GROUP>
				<CTRLS>
					<LABEL>
						TEXT='Namespace'
					</LABEL>
					<DATA_CTRL>
						FMT={
							text.font.style.italic='true';
						}
						FORMULA='\'"\' + getStringParam("nsURI") + \'"\''
					</DATA_CTRL>
				</CTRLS>
			</CTRL_GROUP>
		</AREA>
	</AREA_SEC>
	<TEMPLATE_CALL>
		COND='getBooleanParam("doc.namespace.profile")'
		FMT={
			sec.spacing.before='12';
		}
		TEMPLATE_FILE='namespaceProfile.tpl'
		OUTPUT_TYPE='included'
		DSM_MODE='pass-current-model'
	</TEMPLATE_CALL>
	<FOLDER>
		DESCR='COMPONENT SUMMARY'
		FMT={
			sec.spacing.before='14';
		}
		<BODY>
			<TEMPLATE_CALL>
				DESCR='all elements'
				COND='getStringParam("doc.namespace.cs.element") == "all"'
				FMT={
					sec.spacing.before='12';
				}
				TEMPLATE_FILE='allElementSummary.tpl'
				OUTPUT_TYPE='included'
				DSM_MODE='pass-current-model'
			</TEMPLATE_CALL>
			<TEMPLATE_CALL>
				DESCR='global elements'
				COND='param = getStringParam("doc.namespace.cs.element");\nparam == "global" || param == "global_local"'
				FMT={
					sec.spacing.before='12';
				}
				TEMPLATE_FILE='globalElementSummary.tpl'
				OUTPUT_TYPE='included'
				DSM_MODE='pass-current-model'
			</TEMPLATE_CALL>
			<TEMPLATE_CALL>
				DESCR='local elements'
				COND='param = getStringParam("doc.namespace.cs.element");\nparam == "local" || param == "global_local"'
				FMT={
					sec.spacing.before='12';
				}
				TEMPLATE_FILE='localElementSummary.tpl'
				OUTPUT_TYPE='included'
				DSM_MODE='pass-current-model'
			</TEMPLATE_CALL>
			<TEMPLATE_CALL>
				DESCR='complexTypes'
				COND='getBooleanParam("doc.namespace.cs.complexType")'
				FMT={
					sec.spacing.before='12';
				}
				TEMPLATE_FILE='complexTypeSummary.tpl'
				OUTPUT_TYPE='included'
				DSM_MODE='pass-current-model'
			</TEMPLATE_CALL>
			<TEMPLATE_CALL>
				DESCR='simpleTypes'
				COND='getBooleanParam("doc.namespace.cs.simpleType")'
				FMT={
					sec.spacing.before='12';
				}
				TEMPLATE_FILE='simpleTypeSummary.tpl'
				OUTPUT_TYPE='included'
				DSM_MODE='pass-current-model'
			</TEMPLATE_CALL>
			<TEMPLATE_CALL>
				DESCR='element groups'
				COND='getBooleanParam("doc.namespace.cs.group")'
				FMT={
					sec.spacing.before='12';
				}
				TEMPLATE_FILE='groupSummary.tpl'
				OUTPUT_TYPE='included'
				DSM_MODE='pass-current-model'
			</TEMPLATE_CALL>
			<TEMPLATE_CALL>
				DESCR='attributes'
				COND='getBooleanParam("doc.namespace.cs.attribute")'
				FMT={
					sec.spacing.before='12';
				}
				TEMPLATE_FILE='attributeSummary.tpl'
				OUTPUT_TYPE='included'
				DSM_MODE='pass-current-model'
			</TEMPLATE_CALL>
			<TEMPLATE_CALL>
				DESCR='attribute groups'
				COND='getBooleanParam("doc.namespace.cs.attributeGroup")'
				FMT={
					sec.spacing.before='12';
				}
				TEMPLATE_FILE='attributeGroupSummary.tpl'
				OUTPUT_TYPE='included'
				DSM_MODE='pass-current-model'
			</TEMPLATE_CALL>
		</BODY>
	</FOLDER>
	<TEMPLATE_CALL>
		DESCR='Bottom Message'
		COND='output.type == "document"'
		TEMPLATE_FILE='../about.tpl'
		OUTPUT_TYPE='included'
		DSM_MODE='pass-current-model'
	</TEMPLATE_CALL>
</ROOT>
<STOCK_SECTIONS>
	<FOLDER>
		MATCHING_ET='xs:attribute'
		SS_NAME='Attribte'
		<BODY>
			<AREA_SEC>
				<AREA>
					<CTRL_GROUP>
						FMT={
							par.margin.bottom='6';
						}
						<CTRLS>
							<DATA_CTRL>
								FMT={
									ctrl.option.text.collapseSpaces='true';
									ctrl.option.text.noBlankOutput='true';
									text.style='cs4';
									text.option.renderNLs='false';
								}
								FORMULA='firstSentence (mergeStrings (\n  getValuesByLPath ("xs:annotation/xs:documentation//(#TEXT | #CDATA)")\n))'
							</DATA_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
			<TEMPLATE_CALL>
				TEMPLATE_FILE='../attribute/attributeProfile.tpl'
				PASSED_PARAMS={
					'showNS','false';
				}
				OUTPUT_TYPE='included'
				DSM_MODE='pass-current-model'
			</TEMPLATE_CALL>
		</BODY>
	</FOLDER>
	<FOLDER>
		MATCHING_ET='xs:attributeGroup'
		SS_NAME='Attribte Group'
		<BODY>
			<AREA_SEC>
				<AREA>
					<CTRL_GROUP>
						FMT={
							par.margin.bottom='6';
						}
						<CTRLS>
							<DATA_CTRL>
								FMT={
									ctrl.option.text.collapseSpaces='true';
									ctrl.option.text.noBlankOutput='true';
									text.style='cs4';
									text.option.renderNLs='false';
								}
								FORMULA='firstSentence (mergeStrings (\n  getValuesByLPath ("xs:annotation/xs:documentation//(#TEXT | #CDATA)")\n))'
							</DATA_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
			<TEMPLATE_CALL>
				TEMPLATE_FILE='../groups/attributeGroupProfile.tpl'
				PASSED_PARAMS={
					'showNS','false';
				}
				OUTPUT_TYPE='included'
				DSM_MODE='pass-current-model'
			</TEMPLATE_CALL>
		</BODY>
	</FOLDER>
	<FOLDER>
		MATCHING_ET='xs:%element'
		SS_NAME='Element'
		<BODY>
			<AREA_SEC>
				<AREA>
					<CTRL_GROUP>
						FMT={
							par.margin.bottom='6';
						}
						<CTRLS>
							<DATA_CTRL>
								FMT={
									ctrl.option.text.collapseSpaces='true';
									ctrl.option.text.noBlankOutput='true';
									text.style='cs4';
									text.option.renderNLs='false';
								}
								FORMULA='firstSentence (mergeStrings (\n  getValuesByLPath ("xs:annotation/xs:documentation//(#TEXT | #CDATA)")\n))'
							</DATA_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
			<TEMPLATE_CALL>
				TEMPLATE_FILE='../element/elementProfile.tpl'
				PASSED_PARAMS={
					'showNS','false';
				}
				OUTPUT_TYPE='included'
				DSM_MODE='pass-current-model'
			</TEMPLATE_CALL>
		</BODY>
	</FOLDER>
	<FOLDER>
		MATCHING_ET='xs:group'
		SS_NAME='Element Group'
		<BODY>
			<AREA_SEC>
				<AREA>
					<CTRL_GROUP>
						FMT={
							par.margin.bottom='6';
						}
						<CTRLS>
							<DATA_CTRL>
								FMT={
									ctrl.option.text.collapseSpaces='true';
									ctrl.option.text.noBlankOutput='true';
									text.style='cs4';
									text.option.renderNLs='false';
								}
								FORMULA='firstSentence (mergeStrings (\n  getValuesByLPath ("xs:annotation/xs:documentation//(#TEXT | #CDATA)")\n))'
							</DATA_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
			<TEMPLATE_CALL>
				TEMPLATE_FILE='../groups/groupProfile.tpl'
				PASSED_PARAMS={
					'showNS','false';
				}
				OUTPUT_TYPE='included'
				DSM_MODE='pass-current-model'
			</TEMPLATE_CALL>
		</BODY>
	</FOLDER>
	<AREA_SEC>
		MATCHING_ET='xs:%localElement'
		FMT={
			sec.outputStyle='text-par';
			txtfl.delimiter.type='none';
		}
		SS_NAME='Local Element Name'
		<AREA>
			<CTRL_GROUP>
				<CTRLS>
					<DATA_CTRL>
						<DOC_HLINK>
							TARGET_KEYS={
								'contextElement.id';
								'"detail"';
							}
						</DOC_HLINK>
						FORMULA='((form = getAttrStringValue("form")) == "") ? {\n  schema = getXMLDocument().findChild ("xs:schema");\n  form = schema.getAttrStringValue ("elementFormDefault");\n};\n\nname = getAttrStringValue("name");\n\nform != "qualified" ? name : QName (getStringParam("nsURI"), name)'
					</DATA_CTRL>
					<TEMPLATE_CALL_CTRL>
						FMT={
							text.font.style.bold='false';
						}
						TEMPLATE_FILE='../element/localElementExt.tpl'
						OUTPUT_TYPE='included'
						DSM_MODE='pass-current-model'
					</TEMPLATE_CALL_CTRL>
				</CTRLS>
			</CTRL_GROUP>
		</AREA>
	</AREA_SEC>
	<FOLDER>
		MATCHING_ETS={'xs:complexType';'xs:simpleType'}
		SS_NAME='Type'
		<BODY>
			<AREA_SEC>
				<AREA>
					<CTRL_GROUP>
						FMT={
							par.margin.bottom='6';
						}
						<CTRLS>
							<DATA_CTRL>
								FMT={
									ctrl.option.text.collapseSpaces='true';
									ctrl.option.text.noBlankOutput='true';
									text.style='cs4';
									text.option.renderNLs='false';
								}
								FORMULA='firstSentence (mergeStrings (\n  getValuesByLPath ("xs:annotation/xs:documentation//(#TEXT | #CDATA)")\n))'
							</DATA_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
			<TEMPLATE_CALL>
				TEMPLATE_FILE='../type/typeProfile.tpl'
				PASSED_PARAMS={
					'showNS','false';
				}
				OUTPUT_TYPE='included'
				DSM_MODE='pass-current-model'
			</TEMPLATE_CALL>
		</BODY>
	</FOLDER>
</STOCK_SECTIONS>
CHECKSUM='GDgte1wpv99b+RHRMyZzgA'
</DOCFLEX_TEMPLATE>