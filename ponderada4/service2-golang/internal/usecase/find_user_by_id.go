package usecase

import (
	"service2-golang/internal/domain/entity"
)

type FindUserByIdInputDTO struct {
	Id uint
}

type FindUserByIdOutputDTO struct {
	Id    uint
	Name  string
	Email string
}

type FindUserByIdUseCase struct {
	UserRepository entity.UserRepository
}

func NewFindUserByIdUseCase(userRepository entity.UserRepository) *FindUserByIdUseCase {
	return &FindUserByIdUseCase{
		UserRepository: userRepository,
	}
}

func (uc *FindUserByIdUseCase) Execute(input FindUserByIdInputDTO) (*FindUserByIdOutputDTO, error) {
	user, err := uc.UserRepository.FindUserById(input.Id)
	if err != nil {
		return nil, err
	}
	return &FindUserByIdOutputDTO{
		Id:    user.Id,
		Name:  user.Name,
		Email: user.Email,
	}, nil
}