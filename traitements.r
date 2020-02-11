
# Chargement des packages et librairies

install.packages("RPostgreSQL", repos='http://cran.us.r-project.org') 
library (RPostgreSQL)

# Connection à la base de données Postgres

drv <- dbDriver("PostgreSQL") 
con <- dbConnect(drv, dbname = "lizmap",
				host = "localhost", port = 5432, 
				user = "postgres", password = "postgres")
				
# Récuparation des colonnes de la table en BDD

data_sel <- dbGetQuery (con,
"
SELECT * FROM poi84 where fclass in (select fclass FROM poi84 GROUP BY fclass having count(fclass)>100);

"
)
