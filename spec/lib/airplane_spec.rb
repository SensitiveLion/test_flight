require_relative "../../lib/airplane"

describe Airplane do

  describe "#initialization" do
    my_plane = Airplane.new("cesna", 10, 150)

    it "Returns plane type if correct" do
      expect(my_plane.type).to eq("cesna")
    end
    it "Returns 10 if the wings are loading" do
      expect(my_plane.wing_loading).to eq(10)
    end
    it "Returns power if it has POWWEEERRRRR" do
      expect(my_plane.horsepower).to eq(150)
    end
  end

  describe "#land" do
    my_plane = Airplane.new("cesna", 10, 150)

    context "Engine isn't started and it's on the ground" do
      it "airplane not started, please start" do
        expect(my_plane.land).to eq("no power")
      end
    end

    context "The plane has been started but hasn't taken off" do
      it "airplane already on the ground" do
        expect(my_plane.start)
        expect(my_plane.land).to eq("on the ground")
      end
    end

    context "The plane is already in the air" do
      it "airplane landed" do
        expect(my_plane.start)
        expect(my_plane.takeoff)
        expect(my_plane.land).to eq("landing")
      end
    end
  end

  describe "#takeoff" do
    my_plane = Airplane.new("cesna", 10, 150)

    context "airplane not started" do
      it "airplane not started, please start" do
        expect(my_plane.takeoff).to eq("takeoff failed")
      end
    end

    context "The plane was already started" do
      it "airplane already started" do
        expect(my_plane.start)
        expect(my_plane.takeoff).to eq("taking off")
      end
    end
  end

  describe "#start" do
    my_plane = Airplane.new("cesna", 10, 150)

    my_plane.instance_variable_set("@engine", "off")
    context "when the plane is starting" do
      it "returns true" do
        expect(my_plane.start).to eq("started")
      end
    end

    context "when the plane is already running" do
      it "returns false" do
        expect(my_plane.start).to eq("running")
      end
    end
  end
end
