mysqladmin -u root -p drop recipieces_development
mysqladmin -u root -p create recipieces_development
rake db:migrate
rake db:seed