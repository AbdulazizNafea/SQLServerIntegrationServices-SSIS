/* 
==== Xml conversion Tool to convert Bobbie's Review Tools to Scott's Xml-based Review Tool

==== Directions: 
            * Set up a linked server to the Access .mde/.mdb with the name 'rt'
			* Open the "target" XML file (ExampleReviewTool.xml, for example) and delete all elements/attributes beneath the "ReviewTool" root leaving an "empty" ReviewTool element
					-- Do not delete or modify the ReviewTool element
					-- Your xml file should now have only a declaration and a root (no elements or attributes)
            * Run this script in SQL Server 2005's Management Studio in "Results to Grids" mode	
			* Click on the XML results then copy/paste the output to the ExampleReviewTool.xml underneath the root 
					-- Make sure </ReviewTool> is the last line
			* Change the ReviewTool root's attributes for title and courseNumber to be yours
			* Change whatever .htm files, etc needed to use your "new" file!
*/

SET NOCOUNT ON
/*
SELECT * FROM rt...ChapterNames
SELECT * FROM rt...Questions
*/

SELECT Chapter.Number AS '@number'
	, Chapter.Name AS '@title'
	, (
		SELECT CASE 
			WHEN Correct_Ans=1 THEN 'A' 
			WHEN Correct_Ans=2 THEN 'B' 
			WHEN Correct_Ans=3 THEN 'C' 
			WHEN Correct_Ans=4 THEN 'D' 
			END AS '@correctAnswer'
			, Chapter_Question AS '@questionNumber'
			, Question AS '@questionText'
			, ( SELECT 'A' AS '@letter'
					, sub.A1  '@textAnswer'
				FROM rt...Questions sub 
				WHERE sub.Chapter = q.Chapter AND sub.Chapter_Question = q.Chapter_Question
				FOR XML PATH ('Answer'), TYPE
			) AS 'Answers'
			, ( SELECT 'B' AS '@letter'
					, sub.A2  '@textAnswer'
				FROM rt...Questions sub 
				WHERE sub.Chapter = q.Chapter AND sub.Chapter_Question = q.Chapter_Question
				FOR XML PATH ('Answer'), TYPE
			) AS 'Answers'
			, ( SELECT 'C' AS '@letter'
					, sub.A3  '@textAnswer'
				FROM rt...Questions sub 
				WHERE sub.Chapter = q.Chapter AND sub.Chapter_Question = q.Chapter_Question
				FOR XML PATH ('Answer'), TYPE
			) AS 'Answers'
			, ( SELECT 'D' AS '@letter'
					, sub.A4  '@textAnswer'
				FROM rt...Questions sub 
				WHERE sub.Chapter = q.Chapter AND sub.Chapter_Question = q.Chapter_Question
				FOR XML PATH ('Answer'), TYPE
			) AS 'Answers'
		FROM rt...Questions q
		WHERE q.Chapter = Chapter.Number
		FOR XML PATH('Question'), TYPE
	) AS 'Questions'
FROM rt...ChapterNames AS Chapter
FOR XML PATH('Chapter')