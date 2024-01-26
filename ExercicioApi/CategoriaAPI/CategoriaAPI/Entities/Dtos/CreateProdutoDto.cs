namespace CategoriaAPI.Entities.Dtos
{
    public class CreateProdutoDto
    {
        public string Descricao { get; set; }
        public double Preco { get; set; }
        public int Estoque { get; set; }
        public int CategoriaId { get; set; }

    }
}
