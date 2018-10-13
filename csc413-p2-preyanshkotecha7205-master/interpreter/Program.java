package interpreter;

import java.util.ArrayList;
import java.util.HashMap;

import interpreter.bytecode.*;

public class Program {

    private ArrayList<ByteCode> program;
    private static HashMap<String, Integer> labels = new HashMap<>();

    public Program() {
        program = new ArrayList<>();
    }

    protected ByteCode getCode(int pc) {
        return this.program.get(pc);
    }

    public int getSize() {
        return this.program.size();
    }


    public void addByteCode(ByteCode byteVal)
    {
        if(byteVal instanceof LabelCode)
        {
            LabelCode value = (LabelCode) byteVal;
            Integer PCAddress = this.program.size();
            labels.put(value.getLabel(), PCAddress);
        }
        program.add(byteVal);
    }

    public void resolveAddrs(Program program)
    {
        for (int i = 0; i < program.getSize(); i++)
        {
            if (program.getCode(i) instanceof GotoCode)
            {
                GotoCode val = (GotoCode) program.getCode(i);
                val.setAddress(labels.get(val.getLabel()));

            }
            if (program.getCode(i) instanceof CallCode)
            {
                CallCode val = (CallCode) program.getCode(i);
                val.setAddress(labels.get(val.getLabel()));

            }
            if (program.getCode(i) instanceof FalseBranchCode)
            {
                FalseBranchCode val = (FalseBranchCode) program.getCode(i);
                val.setAddress(labels.get(val.getLabel()));

            }
        }
    }


}
