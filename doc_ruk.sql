-- Запрос на получение справочника Руководящих документов
SELECT 
	"Руководящие документы".key0 AS "key0 Руководящие документы",	
	listmanagement_dateguidancedocumentout_directoryofguidancedocum AS "Дата создания",
	listmanagement_dateguidancedocument_directoryofguidancedocument AS "Дата начала действия",
	listmanagement_dateguidancedocumentoff_directoryofguidancedocum AS "Дата окончания действия",
	listmanagement_numberguidancedocument_directoryofguidancedocume AS "Номер документа",
	"Типы документов".listmanagement_typedocumentname_typedocumentclass AS "Тип документа",
	"Учреждения отправители".innmanagement_fullname_directoryinnclass AS "Организация отправитель",
	"Учреждения адресаты".innmanagement_fullname_directoryinnclass AS "Организация адресат",
	listmanagement_nameguidancedocument_directoryofguidancedocument AS "Наименование документа",
	listmanagement_typeguidancedocument_directoryofguidancedocument AS "Документ (норматив / регламент)",
	listmanagement_status_directoryofguidancedocumentsclass AS "Статус документа", 
	listmanagement_commentdirectoryguidance_directoryofguidancedocu AS "Описание"
	FROM public._auto_listmanagement_directoryofguidancedocumentsclass AS "Руководящие документы"
	LEFT JOIN _auto_listmanagement_typedocumentclass AS "Типы документов" 
	ON "Руководящие документы".listmanagement_datatypedocument_directoryofguidancedocumentscla = "Типы документов".key0
	LEFT JOIN _auto_innmanagement_directoryinnclass AS "Учреждения отправители"
	ON "Руководящие документы".listmanagement_orgsender_directoryofguidancedocumentsclass = "Учреждения отправители".key0
	LEFT JOIN _auto_innmanagement_directoryinnclass AS "Учреждения адресаты"
	ON "Руководящие документы".listmanagement_orgaddressee_directoryofguidancedocumentsclass = "Учреждения адресаты".key0
	


