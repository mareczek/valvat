require 'spec_helper'

describe Valvat::Syntax do
  describe "#validate" do
    it "validates a DE vat number" do
      expect(subject.validate("DE345889003")).to eql(true)

      expect(subject.validate("DE34588900")).to eql(false)
      expect(subject.validate("DE3458890090")).to eql(false)
      expect(subject.validate("DE34588900C")).to eql(false)
    end

    it "validates a AT vat number" do
      expect(subject.validate("ATU03458890")).to eql(true)

      expect(subject.validate("ATU034588908")).to eql(false)
      expect(subject.validate("ATU0345908")).to eql(false)
      expect(subject.validate("ATU0345889Y")).to eql(false)
    end

    it "should validate BE vat number" do
      expect(subject.validate("BE0817331995")).to eql(true)

      expect(subject.validate("BE081733199")).to eql(false)
      expect(subject.validate("BE08173319944")).to eql(false)
      expect(subject.validate("BE081733199H")).to eql(false)
      expect(subject.validate("BE1817331999")).to eql(false)
    end

    it "validates a BG vat number" do
      expect(subject.validate("BG468134789")).to eql(true)
      expect(subject.validate("BG4681347897")).to eql(true)

      expect(subject.validate("BG46813478979")).to eql(false)
      expect(subject.validate("BG4681347897C")).to eql(false)
      expect(subject.validate("BG46813478G")).to eql(false)
      expect(subject.validate("BG46813478")).to eql(false)
    end

    it "validates a CH vat number" do
      expect(subject.validate("CHE108025033")).to eql(true)
      expect(subject.validate("CHE-108025033")).to eql(true)
      expect(subject.validate("CHE-108.025.033")).to eql(true)
      expect(subject.validate("CHE-108.025.033 MWST")).to eql(true)
      expect(subject.validate("CHE-108.025.033MWST")).to eql(true)
      expect(subject.validate("CHE108.025.033MWST")).to eql(true)
      expect(subject.validate("CHE108025033MWST")).to eql(true)
      expect(subject.validate("CHE-108.025.033 TVA")).to eql(true)
      expect(subject.validate("CHE-108.025.033 IVA")).to eql(true)

      expect(subject.validate("CHE6813478")).to eql(false)
      expect(subject.validate("CHE-108.025.033 MWSTE")).to eql(false)
    end

    it "validates a CY vat number" do
      expect(subject.validate("CY36579347A")).to eql(true)
      expect(subject.validate("CY36579347C")).to eql(true)

      expect(subject.validate("CY36579347")).to eql(false)
      expect(subject.validate("CY365793478")).to eql(false)
      expect(subject.validate("CY365793478A")).to eql(false)
      expect(subject.validate("CY365793G")).to eql(false)
    end

    it "validates a DK vat number" do
      expect(subject.validate("DK67893463")).to eql(true)

      expect(subject.validate("DK678934637")).to eql(false)
      expect(subject.validate("DK6789346")).to eql(false)
      expect(subject.validate("DK6789346H")).to eql(false)
    end

    it "validates a ES vat number" do
      expect(subject.validate("ESX67345987")).to eql(true)
      expect(subject.validate("ESA6734598B")).to eql(true)
      expect(subject.validate("ES56734598C")).to eql(true)

      expect(subject.validate("ES167345987")).to eql(false)
      expect(subject.validate("ESX6734598")).to eql(false)
      expect(subject.validate("ESX673459890")).to eql(false)
    end

    it "validates a EE vat number" do
      expect(subject.validate("EE678678456")).to eql(true)
      expect(subject.validate("EE6786784560")).to eql(false)
      expect(subject.validate("EE67867845")).to eql(false)
      expect(subject.validate("EE67867845K")).to eql(false)
    end

    it "validates a FI vat number" do
      expect(subject.validate("FI67845638")).to eql(true)

      expect(subject.validate("FI678456389")).to eql(false)
      expect(subject.validate("FI6784563")).to eql(false)
      expect(subject.validate("FI6784563K")).to eql(false)
    end

    it "validates a FR vat number" do
      expect(subject.validate("FR99123543267")).to eql(true)
      expect(subject.validate("FRBB123543267")).to eql(true)
      expect(subject.validate("FR9B123543267")).to eql(true)
      expect(subject.validate("FRB9123543267")).to eql(true)

      expect(subject.validate("FR99123543267B")).to eql(false)
      expect(subject.validate("FRBB12354326")).to eql(false)
      expect(subject.validate("FR9B123543F67")).to eql(false)
      expect(subject.validate("FRB9123543")).to eql(false)
    end

    it "validates a EL vat number" do
      expect(subject.validate("EL678456345")).to eql(true)

      expect(subject.validate("EL67845634")).to eql(false)
      expect(subject.validate("EL6784563459")).to eql(false)
      expect(subject.validate("EL67845634P")).to eql(false)
    end

    it "validates a HU vat number" do
      expect(subject.validate("HU67894595")).to eql(true)

      expect(subject.validate("HU6789459")).to eql(false)
      expect(subject.validate("HU67894595L")).to eql(false)
      expect(subject.validate("HU6789459J")).to eql(false)
    end

    it "validates a HR vat number" do
      expect(subject.validate("HR12345678912")).to eql(true)

      expect(subject.validate("HR6789459")).to eql(false)
      expect(subject.validate("HR67894595L")).to eql(false)
      expect(subject.validate("HR6789459J")).to eql(false)
    end

    it "validates a IE vat number" do
      expect(subject.validate("IE1B12345J")).to eql(true)
      expect(subject.validate("IE1234567B")).to eql(true)
      expect(subject.validate("IE1234567XX")).to eql(true)

      expect(subject.validate("IE1B123459")).to eql(false)
      expect(subject.validate("IE19123450")).to eql(false)
      expect(subject.validate("IEA9123450")).to eql(false)
      expect(subject.validate("IE1B12345XX")).to eql(false)
      expect(subject.validate("IE1X34567XX")).to eql(false)
    end

    it "validates a IT vat number" do
      expect(subject.validate("IT45875359285")).to eql(true)

      expect(subject.validate("IT458753592859")).to eql(false)
      expect(subject.validate("IT4587535928G")).to eql(false)
      expect(subject.validate("IT4587535928")).to eql(false)
    end

    it "validates a LV vat number" do
      expect(subject.validate("LV85678368906")).to eql(true)

      expect(subject.validate("LV8567836890")).to eql(false)
      expect(subject.validate("LV856783689066")).to eql(false)
      expect(subject.validate("LV8567836890S")).to eql(false)
    end

    it "validates a LT vat number" do
      expect(subject.validate("LT678678987")).to eql(true)
      expect(subject.validate("LT678678987956")).to eql(true)

      expect(subject.validate("LT67867898")).to eql(false)
      expect(subject.validate("LT6786789870")).to eql(false)
      expect(subject.validate("LT678678987K")).to eql(false)
      expect(subject.validate("LT67867898709")).to eql(false)
      expect(subject.validate("LT6786789870C")).to eql(false)
      expect(subject.validate("LT67867898795H")).to eql(false)
    end

    it "validates a LU vat number" do
      expect(subject.validate("LU45679456")).to eql(true)

      expect(subject.validate("LU4567945")).to eql(false)
      expect(subject.validate("LU456794560")).to eql(false)
      expect(subject.validate("LU4567945J")).to eql(false)
    end

    it "validates a MT vat number" do
      expect(subject.validate("MT64569367")).to eql(true)

      expect(subject.validate("MT6456936")).to eql(false)
      expect(subject.validate("MT645693679")).to eql(false)
      expect(subject.validate("MT6456936L")).to eql(false)
    end

    it "validates a NL vat number" do
      expect(subject.validate("NL673739491B77")).to eql(true)

      expect(subject.validate("NL673739491977")).to eql(false)
      expect(subject.validate("NL673739491A77")).to eql(false)
      expect(subject.validate("NL673739491B771")).to eql(false)
      expect(subject.validate("NL673739491B7")).to eql(false)
      expect(subject.validate("NL6737394917B7")).to eql(false)
    end

    it "validates a PL vat number" do
      expect(subject.validate("PL6784567284")).to eql(true)

      expect(subject.validate("PL678456728")).to eql(false)
      expect(subject.validate("PL67845672849")).to eql(false)
      expect(subject.validate("PL678456728K")).to eql(false)
    end

    it "validates a PT vat number" do
      expect(subject.validate("PT346296476")).to eql(true)

      expect(subject.validate("PT34629647")).to eql(false)
      expect(subject.validate("PT3462964769")).to eql(false)
    end

    it "validates a GB vat number" do
      expect(subject.validate("GB123456789")).to eql(true)
      expect(subject.validate("GB123456789012")).to eql(true)
      expect(subject.validate("GBGD123")).to eql(true)
      expect(subject.validate("GBHA123")).to eql(true)

      expect(subject.validate("GB12345678")).to eql(false)
      expect(subject.validate("GB1234567890")).to eql(false)
      expect(subject.validate("GB12345678901")).to eql(false)
      expect(subject.validate("GB1234567890123")).to eql(false)
      expect(subject.validate("GBAB123")).to eql(false)
      expect(subject.validate("GBAA123")).to eql(false)
      expect(subject.validate("GBHH123")).to eql(false)
      expect(subject.validate("GBGD1234")).to eql(false)
      expect(subject.validate("GBGD12")).to eql(false)
    end

    it "validates a RO vat number" do
      expect(subject.validate("RO1234567890")).to eql(true)
      expect(subject.validate("RO123456789")).to eql(true)
      expect(subject.validate("RO12345678")).to eql(true)
      expect(subject.validate("RO1234567")).to eql(true)
      expect(subject.validate("RO123456")).to eql(true)
      expect(subject.validate("RO12345")).to eql(true)
      expect(subject.validate("RO1234")).to eql(true)
      expect(subject.validate("RO123")).to eql(true)
      expect(subject.validate("RO12")).to eql(true)

      expect(subject.validate("RO1")).to eql(false)
      expect(subject.validate("RO0234567890")).to eql(false)
      expect(subject.validate("RO023456789")).to eql(false)
      expect(subject.validate("RO02345678")).to eql(false)
      expect(subject.validate("RO0234567")).to eql(false)
      expect(subject.validate("RO023456")).to eql(false)
      expect(subject.validate("RO02345")).to eql(false)
      expect(subject.validate("RO0234")).to eql(false)
      expect(subject.validate("RO023")).to eql(false)
      expect(subject.validate("RO02")).to eql(false)
      expect(subject.validate("RO12345678901")).to eql(false)
    end

    it "validates a SK vat number" do
      expect(subject.validate("SK5683075682")).to eql(true)

      expect(subject.validate("SK56830756821")).to eql(false)
      expect(subject.validate("SK568307568")).to eql(false)
    end

    it "validates a SI vat number" do
      expect(subject.validate("SI74357893")).to eql(true)

      expect(subject.validate("SI743578931")).to eql(false)
      expect(subject.validate("SI7435789")).to eql(false)
    end

    it "validates a SE vat number" do
      expect(subject.validate("SE567396352701")).to eql(true)

      expect(subject.validate("SE56739635201")).to eql(false)
      expect(subject.validate("SE5673963527701")).to eql(false)
      expect(subject.validate("SE567396352702")).to eql(false)
      expect(subject.validate("SE567396352711")).to eql(false)
    end

    it "validates a CZ vat number" do
      expect(subject.validate("CZ56389267")).to eql(true)
      expect(subject.validate("CZ563892670")).to eql(true)
      expect(subject.validate("CZ5638926790")).to eql(true)

      expect(subject.validate("CZ5638926")).to eql(false)
      expect(subject.validate("CZ56389268901")).to eql(false)
    end

    it "returns false on blank/non-sense vat number" do
      expect(subject.validate("")).to eql(false)
      expect(subject.validate(" ")).to eql(false)
      expect(subject.validate("DE")).to eql(false)
      expect(subject.validate("atu123xyz")).to eql(false)
      expect(subject.validate("xxxxxxxxxx")).to eql(false)
      expect(subject.validate("BEFR")).to eql(false)
    end

    it "allows Valvat instance as input" do
      expect(subject.validate(Valvat.new("DE345889003"))).to eql(true)
      expect(subject.validate(Valvat.new("DE34588900X"))).to eql(false)
    end
  end
end
