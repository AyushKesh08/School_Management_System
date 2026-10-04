<script>
    let arr = ['st1.png','st2.png','st3.png','st5.png','st4.png']
    let count = 0
    const img = document.querySelector('#img')
    
    setInterval((e)=>{
        if(count == arr.length)
            count = 0

        img.src = 'images/'+arr[count++]
    },3000)
</script>

<script>
    const banner = document.querySelector('#banner');
    let str = banner.innerText;
    
    setInterval(() => {
                        let n = str[0];
                        str = str.substring(1) + n;
                        banner.innerText = str;
                    }, 200);

</script>