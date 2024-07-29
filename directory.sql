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