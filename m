Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E8522A7F3
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 20:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740342349; cv=none; b=aetw8d/4R0am11zphWXNLU70/YTqL8RLKH+5oArx6XVL2RIVvxBcZNIUDdAzy/CVCB0NsIdy22N8qWSCWvvdxtjBdzsM8TJr28z+tbdTWCs1RyD9npbDIuohFINx0gnNHWkzMeDL2ozZjLBOQWnE8zmhsktUKfsKr877ThCE9Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740342349; c=relaxed/simple;
	bh=3yjKIYgRIOVvhYFiwNZ7Mv6DvekS5KCI6HkyIkBNqjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QhN4QEcKdBlbi7g+pYMdRaB2VGCMXPGsuVMp3me5tKXOmjS3YBQCvb31XvxhZ3sgWV8R8vX3VDxNWiDsyPpmY1SN4zEzSg+lSjzaqZ+Rlr9xBf+KIeUo8PoibqpV6TfIv4rpEAtLKjVoN3XeN7lBMid62VMngiCdPLgtXv+5gEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWyXD8EM; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWyXD8EM"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so612885666b.3
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 12:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740342346; x=1740947146; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KO/NRoKuG8XetnuWE85hFK1fCgTrWENxYrVqAq/LSbo=;
        b=IWyXD8EMqy9O4aIXFnB0mnrsDQkQnLJie4ajU3VljTORuBB0fMZhUU4m10oLmRn4qo
         5qVqZxURLxkZI2JXKLSuR76XZRvMlC5r3rFFijk7forL271UOkgDEotdJxfLG3feMbpG
         D+CZduA85jMrGaTyaRMrTplHBF+v8AQnCTOyCEmQzAPjF152djVvrcXOW0Tg/fxS3WdI
         3GA6rIOuz1zJ/uLH0/QoiqrloVWv3r18NzR+NjG3LJ2k7foq/jbpA0ptlVPH3/CNVunS
         4SCKlHmMvaAGToSMgUI9OTyVRNptZi/UMDwfm+DrkvM0DyUhQ5FJueDSajVh/dYS4TAf
         r/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740342346; x=1740947146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KO/NRoKuG8XetnuWE85hFK1fCgTrWENxYrVqAq/LSbo=;
        b=QOzaaFIT2kQ7xHN28iZhxzulqguDGBHiwqEW128DmNadP9yiKz/9HLIMLRozDrlG3f
         D02avun6d8lHQLMLE+kHVTxx3shMtABv5iAaI33KGPRcQUnDdl5BV8RPagmtQ0bPYFD6
         1ug4URZfowHf0E2wXMzHPBWHQHVMstt9PF/oZ22UnXr7NDA1A17oDYjbkNgwa+MkrLe2
         wR0d37URfjmNfy3e01kMwYOd62MnAPJUZNjGhRMVo0wMq+9phauubdH1Vhndm07APYqC
         nzFhSOufnTQDpO7yOMfBKSHDhjqG3gOKuvwpy9SYFV4QFRm8n5l/Np9jop/8NWF13077
         tVgA==
X-Forwarded-Encrypted: i=1; AJvYcCW0JaeGcM56KDUy+0bE514hsDfBlBdnsTUID+rM4iWkz17+4qy7V8cvFNeN/LOm8e7W+HrqrSMW438=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0HHvcTrOaHkId7LvBR1YEpmDYOIhluVeXgMrMS3TnX9Eee1Ra
	+2pk5dBvm+PyEl2mUnhS4ITAXFwer/22BGghY0WNWjjjrvMRj/Dk
X-Gm-Gg: ASbGncuhMCrqq5TWGUvcqipJMRzQDq2kzL9vV85eY8wt9tWZUDsvklOHiXdtfEx+n5a
	NZAqTfLineXh6rwXqBzXetmY0QxTgXmMClDvSHRUqgClvDAZBSA0B3pfySVdjXUM6yYw1V/n033
	OvHUmeXWqfJMKJHQlH+8yHi1x0D0QEiBTw9ceYba+cJEKQLOSoxdO5mopg/fHqkZw3wRA3SXZ+q
	etfGGNT8p75f+14qUfqQoko2UXAJjh867HhritAhOsFxEo9aBuxAHTjigmvsPi8AUKLjdKzg7H5
	wkPdem9+Cl6HbL/FDN184YD2vOA=
X-Google-Smtp-Source: AGHT+IEASkBZDUs2HV66FfbppKxrXfiPEOQdWl35/1TkX9MbOUwdnZRhQOYUiSPPWnjZ/EnkcBUtNQ==
X-Received: by 2002:a17:907:1b26:b0:ab7:be81:8944 with SMTP id a640c23a62f3a-abc099b88ccmr1174431166b.6.1740342346244;
        Sun, 23 Feb 2025 12:25:46 -0800 (PST)
Received: from [192.168.1.100] ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbbe74100asm1142813766b.95.2025.02.23.12.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 12:25:45 -0800 (PST)
Message-ID: <602e03fd-ce4b-feef-5053-e95834ab35d7@gmail.com>
Date: Sun, 23 Feb 2025 21:25:42 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 00/17] Introduce and use generic parity32/64 helper
To: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com,
 mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, parthiban.veerasooran@microchip.com,
 arend.vanspriel@broadcom.com, johannes@sipsolutions.net,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, yury.norov@gmail.com,
 akpm@linux-foundation.org
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
Content-Language: en-US
From: Uros Bizjak <ubizjak@gmail.com>
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:
> Several parts of the kernel contain redundant implementations of parity
> calculations for 32-bit and 64-bit values. Introduces generic
> parity32() and parity64() helpers in bitops.h, providing a standardized
> and optimized implementation.
> 
> Subsequent patches refactor various kernel components to replace
> open-coded parity calculations with the new helpers, reducing code
> duplication and improving maintainability.

Please note that GCC (and clang) provide __builtin_parity{,l,ll}() 
family of builtin functions. Recently, I have tried to use this builtin 
in a couple of places [1], [2], but I had to retract the patches, 
because __builtin functions aren't strictly required to be inlined and 
can generate a library call [3].

As explained in [2], the compilers are able to emit optimized 
target-dependent code (also automatically using popcnt insn when 
avaialble), so ideally the generic parity64() and parity32() would be 
implemented using __builtin_parity(), where the generic library would 
provide a fallback __paritydi2() and __paritysi2() functions, otherwise 
provided by the compiler support library.

For x86, we would like to exercise the hardware parity calculation or 
optimized code sequences involving HW parity calculation, as shown in 
[1] and [2].

[1] https://lore.kernel.org/lkml/20250129205746.10963-1-ubizjak@gmail.com/

[2] https://lore.kernel.org/lkml/20250129154920.6773-2-ubizjak@gmail.com/

[3] 
https://lore.kernel.org/linux-mm/CAKbZUD0N7bkuw_Le3Pr9o1V2BjjcY_YiLm8a8DPceubTdZ00GQ@mail.gmail.com/

Thanks,
Uros.
