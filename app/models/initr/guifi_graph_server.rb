class Initr::GuifiGraphServer < Initr::Klass
  unloadable

  validates_presence_of :snpgraphserverid, :on => :update

  self.accessors_for(%w(snpgraphserverid rootzone snpdataserverurl mrtgconfigsource cnmlsource
                       rrddbpath rrdimgpath rrdtoolversion))
  self.adds_klass(Initr::PackageManager)

  def initialize(attributes=nil)
    super
    self.snpgraphserverid=""
    self.rootzone="3671"
    self.snpdataserverurl="http://guifi.net"
    self.mrtgconfigsource="http://www.guifi.net/snpservices/graphs/cnml2mrtgcsv.php?server="
    self.cnmlsource="http://www.guifi.net/snpservices/common/qnodes.php?nodes=%s"
    self.rrddbpath="/var/lib/snpservices/rrdb/"
    self.rrdimgpath="/var/lib/snpservices/rrimg/"
    self.rrdtoolversion="1.3"
  end

end
