package usecase

import (
	"service2-golang/internal/domain/entity"
)	

type FindAllUsersOutputDTO struct {
	Users []*entity.User
}

type FindAllUsersUseCase struct {
	UserRepository entity.UserRepository
}

func NewFindAllUsersUseCase(userRepository entity.UserRepository) *FindAllUsersUseCase {
	return &FindAllUsersUseCase{
		UserRepository: userRepository,
	}
}

func (uc *FindAllUsersUseCase) Execute() (*FindAllUsersOutputDTO, error) {
	users, err := uc.UserRepository.FindAllUsers()
	if err != nil {
		return nil, err
	}
	return &FindAllUsersOutputDTO{
		Users: users,
	}, nil
}

