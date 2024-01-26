using AutoMapper;
using CategoriaAPI.Data;
using CategoriaAPI.Entities.Dtos;

namespace CategoriaAPI.Profiles
{
    public class ProdutoProfile : Profile
    {
        public ProdutoProfile()
        {
            CreateMap<Produto, CreateProdutoDto>();
            CreateMap<CreateProdutoDto, Produto>();

            CreateMap<Produto, UpdateProdutoDto>();
            CreateMap<UpdateProdutoDto, Produto>();

            CreateMap<Categoria, CreateCategoriaDto>();
            CreateMap<CreateCategoriaDto, Categoria>();

        }
    }
}
