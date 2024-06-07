#!/bin/bash

# データベースファイルの名前
DB_FILE="gorm.db"
SQL_FILE="blog_schema_and_data.sql"

# SQLite3コマンドを実行してデータベースとテーブルを作成し、サンプルデータを挿入
sqlite3 $DB_FILE < $SQL_FILE

echo "SQLiteデータベースとサンプルデータの作成が完了しました。"
