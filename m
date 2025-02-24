Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2399A2837B
	for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 15:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740410661; cv=none; b=THO9SJFcnG0u0/tIHdkv286UJAqI37Y5Qq8AU52IilY6qjbqoMHlLizoYvPily73vR0zO6yjG2rsqzVeycnIJihKtmo+PKO561/xB2a/TFZsvWemo+o1HD7C/maCi2LzyWHSwk1jguK43CB4KHuemKd2z774p4fUdzKaEj5pbFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740410661; c=relaxed/simple;
	bh=+JH9WFIVg0ke/75TFC25dWturzu4JHdGKnJIyiQPccM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q/you+aBKq7dJ+joVq+ka63Vta0b+TqWcsrafvCIsufliUBu9YXAJGJ/JFvGys7H2y6O//iTzYkwEmSBIxJ0TZQYrfNxI+9tXratBApyO3YHEZUwGQfD4WTiXTb54yXOCVbM6yTZxsIqJd1Y5E2mAoQlAoLsMN2BLrqgVHZLm+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRFvnUH4; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRFvnUH4"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abb75200275so721849766b.3
        for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 07:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740410658; x=1741015458; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=90b7JTu64HyQeEwAMfpKEcwfZyjyUK0IOy6HdZ/FyAs=;
        b=YRFvnUH4ouTEuL3jVNWVN97X9+/1pYAd0JqhqUSTpzdDts1J+9UMqsLYSuNln+Kqck
         oLkAjnH2SuIpAlrYdR1X4+4QTDMK7Qty3asg5po3yjskEcsj65oB0oOIOLhQ7AF04lfC
         Mu/kbO0Ap4j+E4N44JKth2EZ/TuaGphCnb9YD6W75cOG8iuVq6a54hmCWvSz2aQY3DqT
         cwlz606vdrT2YNBh716KFSNIkm8YkCzBuU+/+G1bI5iElforzwxmaZtyf852F81q3Bxu
         nv+5p50Zz1uEfDMJ413id5aZ53ogthunELbbbSoTXzYpWpuLYamIKLDQeXW4xtVstHTi
         Ot5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740410658; x=1741015458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=90b7JTu64HyQeEwAMfpKEcwfZyjyUK0IOy6HdZ/FyAs=;
        b=pQQu7OQwrUqwmHPUO75VaqoF0Kw5kHs3EI8RIVYhWI27S3+4csGJZSXrgYcPj9NuIv
         3m1eHtNj2OeXZ/OgPkwDJG7cNoagyMJWoxYZayf0oT+UouryLtdix1MCwPwjk3V9wK0R
         ko0Mwi8rCVx5iL/2YW9djddP33PV78deryHqiHLT7Wxn7s7mTJXXA0EJ57lbKqGviNf9
         ynztvqm2xOu3kpyXQnMNmXNWZmMapD/J80CGIHAOyed0ggXstI2I1XddLS3OWVV7AKO1
         FtQk1b56rmylkdEE1Y1lpBLYFFCNDcE7qyY94y9m8eGRCF1sHBx1Xf2DZgecpIzdRPKX
         b+gA==
X-Forwarded-Encrypted: i=1; AJvYcCWI58MLKcybe7OsIQyDrwN8U54a0y968x0MyaRCUlZ5/KQQ6oEsAwz7Alkp1gsZblLiFobyPIvhL2I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvk/VdXN3f8ulqB2UU+hhvcCspwXtwqZL1Z4VkCswJ0oDhqhI1
	+qN2I89+ub0ekm9GsbvLGqnPXJTLUk47ZsXIlQexqeSE+WaDjSFh
X-Gm-Gg: ASbGncv2AoSrzUB+02TF2kFwOvqOIzL+S3vEKaLgEP5h8OJ+m0teI/RxmqJ5RcQmczF
	7VAXZ8wNPM2WJeDlJIW74kDSQ1mcojXauz75aGjfBkJpaiHhNrntPVIoPTuIXe++0y+OrQvI3jV
	sJpxqqVw/VMkvpLTfljEJJdhJsYWv7CKCSm0cslpGfXcx56lwjBzQnMhiJU7hUMu/xIl8E4z2YC
	tyGmfNiQEnAxbE3sNedm4rKbLN6dIOnTbD6qr9dmueuJFeHrP6WmQbTRkncc0s5enQh86wSudTv
	Y9rICtG9RBcvl0nI6GCXUgqYVIg=
X-Google-Smtp-Source: AGHT+IFuxTp/JUjRKgHm6bk8HGglm4eMoWBRrY8PM6xIIRBJOeg9hhqPfUM+m5fxkbKuGg8YC/F0FQ==
X-Received: by 2002:a17:907:c29:b0:ab7:86ae:4bb8 with SMTP id a640c23a62f3a-abc09a0bc37mr1270641566b.23.1740410658075;
        Mon, 24 Feb 2025 07:24:18 -0800 (PST)
Received: from [192.168.1.100] ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9f8442c0sm1531734566b.150.2025.02.24.07.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 07:24:17 -0800 (PST)
Message-ID: <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
Date: Mon, 24 Feb 2025 16:24:14 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 03/17] x86: Replace open-coded parity calculation with
 parity8()
To: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 Ingo Molnar <mingo@redhat.com>, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com,
 mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, parthiban.veerasooran@microchip.com,
 arend.vanspriel@broadcom.com, johannes@sipsolutions.net,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, yury.norov@gmail.com,
 akpm@linux-foundation.org, mingo@kernel.org
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com>
Content-Language: en-US
From: Uros Bizjak <ubizjak@gmail.com>
In-Reply-To: <20250223164217.2139331-4-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:
> Refactor parity calculations to use the standard parity8() helper. This
> change eliminates redundant implementations and improves code
> efficiency.

The patch improves parity assembly code in bootflag.o from:

   58:	89 de                	mov    %ebx,%esi
   5a:	b9 08 00 00 00       	mov    $0x8,%ecx
   5f:	31 d2                	xor    %edx,%edx
   61:	89 f0                	mov    %esi,%eax
   63:	89 d7                	mov    %edx,%edi
   65:	40 d0 ee             	shr    %sil
   68:	83 e0 01             	and    $0x1,%eax
   6b:	31 c2                	xor    %eax,%edx
   6d:	83 e9 01             	sub    $0x1,%ecx
   70:	75 ef                	jne    61 <sbf_init+0x51>
   72:	39 c7                	cmp    %eax,%edi
   74:	74 7f                	je     f5 <sbf_init+0xe5>
   76:

to:

   54:	89 d8                	mov    %ebx,%eax
   56:	ba 96 69 00 00       	mov    $0x6996,%edx
   5b:	c0 e8 04             	shr    $0x4,%al
   5e:	31 d8                	xor    %ebx,%eax
   60:	83 e0 0f             	and    $0xf,%eax
   63:	0f a3 c2             	bt     %eax,%edx
   66:	73 64                	jae    cc <sbf_init+0xbc>
   68:

which is faster and smaller (-10 bytes) code.

Reviewed-by: Uros Bizjak <ubizjak@gmail.com>

Thanks,
Uros.

> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>   arch/x86/kernel/bootflag.c | 18 +++---------------
>   1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
> index 3fed7ae58b60..314ff0e84900 100644
> --- a/arch/x86/kernel/bootflag.c
> +++ b/arch/x86/kernel/bootflag.c
> @@ -8,6 +8,7 @@
>   #include <linux/string.h>
>   #include <linux/spinlock.h>
>   #include <linux/acpi.h>
> +#include <linux/bitops.h>
>   #include <asm/io.h>
>   
>   #include <linux/mc146818rtc.h>
> @@ -20,26 +21,13 @@
>   
>   int sbf_port __initdata = -1;	/* set via acpi_boot_init() */
>   
> -static int __init parity(u8 v)
> -{
> -	int x = 0;
> -	int i;
> -
> -	for (i = 0; i < 8; i++) {
> -		x ^= (v & 1);
> -		v >>= 1;
> -	}
> -
> -	return x;
> -}
> -
>   static void __init sbf_write(u8 v)
>   {
>   	unsigned long flags;
>   
>   	if (sbf_port != -1) {
>   		v &= ~SBF_PARITY;
> -		if (!parity(v))
> +		if (!parity8(v))
>   			v |= SBF_PARITY;
>   
>   		printk(KERN_INFO "Simple Boot Flag at 0x%x set to 0x%x\n",
> @@ -70,7 +58,7 @@ static int __init sbf_value_valid(u8 v)
>   {
>   	if (v & SBF_RESERVED)		/* Reserved bits */
>   		return 0;
> -	if (!parity(v))
> +	if (!parity8(v))
>   		return 0;
>   
>   	return 1;
