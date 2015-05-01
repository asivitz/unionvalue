require 'json'

class UnionValue
  def self.new(*values, &block)

    Class.new do
      attr_accessor(:type, :data, *values)

      values.each do |value|
          define_singleton_method(value) do |*val|
              a = self.new
              a.data = val.first if val
              a.type = value
              a.freeze
              a
          end

          define_method(:"is_#{value}?") do
              type == value
          end
      end

      const_set :VALUES, values

      def ==(other)
        eql?(other)
      end

      def eql?(other)
        self.class == other.class && self.type == other.type && self.data == other.data
      end

      def inspect
        "#<#{self.class.name} #{self.type}:#{self.data}>"
      end

      def to_json(*a)
        {
          "json_class"   => self.class.name,
          "data"         => {"type" => type, "data" => data }
        }.to_json(*a)
      end

      def self.json_create(o)
        self.send(o['data']['type'], o['data']['data'])
      end

      class_eval &block if block
    end
  end
end
