namespace CategoriaAPI.Entities.Dtos
{
    public class UpdateProdutoDto
    {
        public string Descricao { get; set; }
        public double Preco { get; set; }
        public int Estoque { get; set; }
        public int CategoriaId { get; set; }
    }
}
