Declare @execution_id bigint
EXEC [SSISDB].[catalog].[create_execution] 
											@package_name=N'HighestSalarySP.dtsx'
											,@execution_id=@execution_id OUTPUT
											,@folder_name=N'Course134'
											,@project_name=N'Production'
											,@use32bitruntime=False
											--,@reference_id=NULL  --either omit or use NULL if not referencing an environmet.

--DECLARE @var0 int = 1
--EXEC [SSISDB].[catalog].[set_execution_parameter_value] 
--											@execution_id
--											,@object_type=30		--30 means it is a package level parameter. 20 means it is project level
--											,@parameter_name=N'Division'
--											,@parameter_value=@var0
--DECLARE @var1 nvarchar = 'F'
--EXEC [SSISDB].[catalog].[set_execution_parameter_value] 
--											@execution_id
--											,@object_type=30
--											,@parameter_name=N'Gender'
--											,@parameter_value=@var1

EXEC [SSISDB].[catalog].[start_execution] @execution_id
GO