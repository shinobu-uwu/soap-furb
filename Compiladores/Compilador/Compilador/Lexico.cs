namespace Compilador;

public class Lexico : Constants
{
    private int Position;
    private string Input;

    public Lexico(string texto)
    {
        Input = texto;
        Position = 0;
    }

    public Token NextToken()
    {
        if (!HasInput())
            return null;

        int start = Position;

        int state = 0;
        int lastState = 0;
        int endState = -1;
        int end = -1;

        while (HasInput())
        {
            lastState = state;
            state = NextState(NextChar(), state);

            if (state < 0)
                break;

            else
            {
                if (TokenForState(state) >= 0)
                {
                    endState = state;
                    end = Position;
                }
            }
        }

        if (endState < 0 || (endState != state && TokenForState(lastState) == -2))
            throw new LexicalError(ScannerError[lastState], start);

        Position = end;

        int token = TokenForState(endState);

        if (token == 0)
            return NextToken();
        else
        {
            String lexeme = Input.Substring(start, end);
            token = LookupToken(token, lexeme);
            return new Token(token, lexeme, start);
        }
    }

    private int NextState(char? c, int state)
    {
        if (c is null)
        {
            return -1;
        }

        int start = ScannerTableIndexes[state];
        int end = ScannerTableIndexes[state + 1] - 1;

        while (start <= end)
        {
            int half = (start + end) / 2;

            if (ScannerTable[half][0] == c)
                return ScannerTable[half][1];
            else if (ScannerTable[half][0] < c)
                start = half + 1;
            else //(SCANNER_TABLE[half][0] > c)
                end = half - 1;
        }

        return -1;
    }

    private int TokenForState(int state)
    {
        if (state < 0 || state >= TokenState.Length)
            return -1;

        return TokenState[state];
    }

    public int LookupToken(int child, string key)
    {
        int start = SpecialCasesIndexes[child];
        int end = SpecialCasesIndexes[child + 1] - 1;

        while (start <= end)
        {
            int half = (start + end) / 2;
            int comp = SpecialCasesKeys[half].CompareTo(key);

            if (comp == 0)
                return SpecialCasesValues[half];
            else if (comp < 0)
                start = half + 1;
            else //(comp > 0)
                end = half - 1;
        }

        return child;
    }

    private bool HasInput()
    {
        return Position < Input.Length;
    }

    private char? NextChar()
    {
        if (HasInput())
            return Input[Position++];

        return null;
    }
}