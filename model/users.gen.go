// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.

package model

import (
	"time"
)

const TableNameUser = "users"

// User mapped from table <users>
type User struct {
	UserID       int32     `gorm:"column:user_id;type:INTEGER;primaryKey" json:"user_id"`
	Username     string    `gorm:"column:username;type:TEXT;not null" json:"username"`
	Email        string    `gorm:"column:email;type:TEXT;not null" json:"email"`
	PasswordHash string    `gorm:"column:password_hash;type:TEXT;not null" json:"password_hash"`
	CreatedAt    time.Time `gorm:"column:created_at;type:TIMESTAMP;not null;default:CURRENT_TIMESTAMP" json:"created_at"`
}

// TableName User's table name
func (*User) TableName() string {
	return TableNameUser
}
