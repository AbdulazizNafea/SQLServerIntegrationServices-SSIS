USE SSISDB

DECLARE @execution_id INT;
EXEC catalog.create_execution  @folder_name = 'Course134'
     ,  @project_name = 'Production'
     ,  @package_name =  'Ch4ImportBlob.dtsx'
     ,  @execution_id =  @execution_id OUTPUT

EXEC catalog.start_execution @execution_id
