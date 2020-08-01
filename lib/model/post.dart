class Post{
   //const Post({
   Post({
    this.title,
    this.author,
    this.imageUrl,
    this.description,
  });

  final String title;
  final String author;
  final String imageUrl;
  final String description;

  bool selected = false;
}
  final List<Post> posts = [
    Post(
      title: 'War and Peace',
      author: 'Tolstoy',
      description: '《战争与和平》是俄国作家列夫·尼古拉耶维奇·托尔斯泰创作的长篇小说，也是其代表作，创作于1863—1869年。该作以1812年的卫国战争为中心，反映从1805到1820年间的重大历史事件。',
      imageUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596014885123&di=f2345897383d53089d9bc8fcddfe7753&imgtype=0&src=http%3A%2F%2Ft9.baidu.com%2Fit%2Fu%3D3363001160%2C1163944807%26fm%3D79%26app%3D86%26f%3DJPEG%3Fw%3D1280%26h%3D830',
    ),
    Post(
      title: 'Анна Каренина',
      author: 'Tolstoy',
      description:'Анна Каренина',
      imageUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596014885123&di=cac0c48ff079a4b9934b4ee7ca0b6bb7&imgtype=0&src=http%3A%2F%2Ft9.baidu.com%2Fit%2Fu%3D583874135%2C70653437%26fm%3D79%26app%3D86%26f%3DJPEG%3Fw%3D3607%26h%3D2408',
    ),
    Post(
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      description:'Pride and Prejudice',
      imageUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596014885122&di=8f8f31785ba489e32d5bdadd08cb3ec1&imgtype=0&src=http%3A%2F%2Ft9.baidu.com%2Fit%2Fu%3D2268908537%2C2815455140%26fm%3D79%26app%3D86%26f%3DJPEG%3Fw%3D1280%26h%3D719',
    ),
    Post(
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      description:'Pride and Prejudice',
      imageUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596014885122&di=8f8f31785ba489e32d5bdadd08cb3ec1&imgtype=0&src=http%3A%2F%2Ft9.baidu.com%2Fit%2Fu%3D2268908537%2C2815455140%26fm%3D79%26app%3D86%26f%3DJPEG%3Fw%3D1280%26h%3D719',
    ),
    Post(
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      description:'Pride and Prejudice',
      imageUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596014885122&di=8f8f31785ba489e32d5bdadd08cb3ec1&imgtype=0&src=http%3A%2F%2Ft9.baidu.com%2Fit%2Fu%3D2268908537%2C2815455140%26fm%3D79%26app%3D86%26f%3DJPEG%3Fw%3D1280%26h%3D719',
    ),
    Post(
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      description:'Pride and Prejudice',
      imageUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596014885122&di=8f8f31785ba489e32d5bdadd08cb3ec1&imgtype=0&src=http%3A%2F%2Ft9.baidu.com%2Fit%2Fu%3D2268908537%2C2815455140%26fm%3D79%26app%3D86%26f%3DJPEG%3Fw%3D1280%26h%3D719',
    ),
    Post(
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      description:'Pride and Prejudice',
      imageUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596014885122&di=8f8f31785ba489e32d5bdadd08cb3ec1&imgtype=0&src=http%3A%2F%2Ft9.baidu.com%2Fit%2Fu%3D2268908537%2C2815455140%26fm%3D79%26app%3D86%26f%3DJPEG%3Fw%3D1280%26h%3D719',
    ),
    Post(
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      description:'Pride and Prejudice',
      imageUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596014885122&di=8f8f31785ba489e32d5bdadd08cb3ec1&imgtype=0&src=http%3A%2F%2Ft9.baidu.com%2Fit%2Fu%3D2268908537%2C2815455140%26fm%3D79%26app%3D86%26f%3DJPEG%3Fw%3D1280%26h%3D719',
    ),
    Post(
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      description:'Pride and Prejudice',
      imageUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596014885122&di=8f8f31785ba489e32d5bdadd08cb3ec1&imgtype=0&src=http%3A%2F%2Ft9.baidu.com%2Fit%2Fu%3D2268908537%2C2815455140%26fm%3D79%26app%3D86%26f%3DJPEG%3Fw%3D1280%26h%3D719',
    ),
    Post(
      title: 'A Tale of Two Cities',
      author: 'Charles John Huffam Dickens',
      description:'A Tale of Two Cities',
      imageUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596263977042&di=babcba11595daa2c9f6b83df6bd87798&imgtype=0&src=http%3A%2F%2Fimg3.jarhu.com%2Fgoodimages%2F201205%2F02%2Fwj1335941024849.jpg_big.jpg',
    ),
    Post(
      title: 'The Pickwick Papers',
      author: 'Charles John Huffam Dickens',
      description:'The Pickwick Papers',
      imageUrl: 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3856345400,500040484&fm=26&gp=0.jpg',
    ),
    Post(
      title: 'Wuthering Heights',
      author: 'Emily Jane Bronte',
      description:'Wuthering Heights',
      imageUrl: 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3544446866,498686597&fm=26&gp=0.jpg',
    ),
    Post(
      title: 'David Copperfield',
      author: 'Charles John Huffam Dickens',
      description:'David Copperfield',
      imageUrl: 'https://bkimg.cdn.bcebos.com/pic/4afbfbedab64034f1abc7ec8a5c379310b551d8e?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U5Mg==,g_7,xp_5,yp_5',
    ),
    Post(
      title: 'The Old Curiosity Shop',
      author: 'Charles John Huffam Dickens',
      description:'The Old Curiosity Shop',
      imageUrl: 'https://bkimg.cdn.bcebos.com/pic/a08b87d6277f9e2ffd8635ee1f30e924b999f3a1?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5',
    ),
  ];

