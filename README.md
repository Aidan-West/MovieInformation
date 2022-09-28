# MovieInformation
Movie Information App


PODLAR:

Projemde 4 adet pod kullanımı gerçekleştirdim bunlar:

pod 'Hero'
pod 'SwiftyJSON'
pod 'Kingfisher'
pod 'lottie-ios'

Podları olacak şekilde. Kingfisher podunu API içerisinde gelen görselleri gösterebilmek için kullandım.
Hero podunu ekran geçişleri için kurdum ve kullandım. Daha farklı geçişler kullanmak istediğim taktirde gene Hero kullanmayı tercih ettiğimden ötürü bu podu tercih ettim.
Animasyonlar için ise Lootie podunu tercih ettim.

Loading Animasyonu:

Loading animasyonunu lootie ile kullandım. Bunu 2 şekilde kullanma şansım vardı bunlardan ilki;

API yüklenmesi bittiğinde animasyonun eş zamanlı bitmesi, ikincisi ise;
Animasyon gösterilirken arkadan API verilerinin yüklenmesi.

Bu seçeneklerde ikinci seçeneği seçtim çünkü kullandığım API içerisinde çok yüksek veri yok ve hızlıca geliyor, animasyonun yarıda kesilip kötü bir görüntü vermemesi için bu yoldan ilerledim.

API:

APIHandler kısmında kullandığım for döngüsü ile istediğim verileri çekerek projemin içerisinde kullandım. Gelen verileri CollectionView'ıma ekledim.

Search Bar:

Projemde eklemiş olduğum searchbar filmlerin isimlerine yani titlelarına göre arama gerçekleştiriyor. Verilerin her aramada reload olabilmesi adına 2. bir filtered array ekledim ve sürekliliği sağladım. Eğer aramada bir sonuç elde edilemez ise, uyarı mesajı vc içerisinde gözüküyor.
