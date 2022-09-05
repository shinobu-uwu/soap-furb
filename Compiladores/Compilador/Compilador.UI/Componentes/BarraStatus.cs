namespace Compilador.UI.Componentes;

public sealed class BarraStatus : Label
{
    private const int Altura = 25;
    
    public BarraStatus()
    {
        Size = new Size(900, Altura);
        Anchor = AnchorStyles.Bottom | AnchorStyles.Left;
        Text = "Editor iniciado!";
        Location = new Point(0, 540);
    }
}