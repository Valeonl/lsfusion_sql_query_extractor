-- Запрос на получение информации по учреждениям
SELECT 
	"Учреждения".key0 AS "key0 Учреждения",
	innmanagement_inn_directoryinnclass AS "ИНН",
	innmanagement_shortname_directoryinnclass AS "Краткое наименование",
	innmanagement_fullname_directoryinnclass AS "Полное наименование",
	"Тип учреждения".innmanagement_typeinn_directorytypeeiclass AS "Тип учреждения",
	"Статус учреждения".innmanagement_namestatusinstitution_statusinstitutionclass AS "Статус учреждения"
	FROM 
	_auto_innmanagement_directoryinnclass "Учреждения"
	LEFT JOIN _auto_innmanagement_directorytypeeiclass AS "Тип учреждения"
	ON "Учреждения".innmanagement_inntype_directoryinnclass="Тип учреждения".key0
	LEFT JOIN _auto_innmanagement_statusinstitutionclass AS "Статус учреждения"
	ON "Учреждения".innmanagement_status_directoryinnclass="Статус учреждения".key0
	ORDER BY "Учреждения".key0 DESC


-- Запрос на получение информации по Руководящим документам
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
	
