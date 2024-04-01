Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10211078F
	for <brcm80211@lists.linux.dev>; Mon,  1 Apr 2024 09:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711964699; cv=none; b=pXfRwMDVfYroAMfOeePF6t8Wjc9tvphcgUL4FvFvpx3XTYsYItf1AznIGJx5riSRRBKGTEKtMx6/SOlThSg3uoHiDxeD9xUJ+ptYZ9ixp2zooDaUf8KMCMFIyiJTJ5hOSXCeLAEMQkw6eIIncF7Hcqut66yRWuIkNhnkCmrlwfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711964699; c=relaxed/simple;
	bh=qyBtU57NPao8HVv6aPFX8AvzCNq74vDsTKJluz1U3sM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTjUeRZ34mTkTweoApHsFn6/7/3+E3NqL4c7QHALKpGge3T5kobhuw0oF863Nsb/B8Rnd9pl9nFpVjTHDq0c593G1vcI21SxdHUYpAXWv6M0xbif5xZbBXWtbEhxMbLiUPv/EMomFckayw1mqiRXHDZnUOGhfIa0i8GSJTZ+IOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QnHoVEoX; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QnHoVEoX"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56c197d042fso4593264a12.0
        for <brcm80211@lists.linux.dev>; Mon, 01 Apr 2024 02:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711964695; x=1712569495; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d+diNP0/3LUwNWUT5gbc+2tWQaGcrSkj9S8RpDkHp50=;
        b=QnHoVEoXpPPEbdWYvU0VpV6WKzwtvRCWkbjZ/J54Town4bWW1Vqax/Nrk3Sakhxe5z
         Fefb1YGf5VaBq1A2+v4RAlqkrJCYMRIBOWKPOahr9qXV0SiFeAORAxEtbhIexWN3ARuz
         fnWAoA8laPuZ7IazJO0oD8gq8N12A1iQhIQz+OJbisflxyKC28N30PX4Dlkao7yeasXN
         U8BR2V1vC0yQCppPIu69oNJ5FnqrMfjNAM1iMyDcJA0fRY7AXjsfznUzxm1r0syAe1rO
         +PYIGt9DiVcShDAA+0yh6spyn3rijFh3pQaA4SgpUiKxpLRC6lSgF5NLNmBRr71Uvtfp
         wIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711964695; x=1712569495;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+diNP0/3LUwNWUT5gbc+2tWQaGcrSkj9S8RpDkHp50=;
        b=o7fwO6QHIM7xR3m2TiHD5gd7IwEmKfylatfAZfH3xHNePiPAXW89gxkn9aVFewDuHf
         Fnn5FcLwlTtuunenv8Mp/gqXA+JoaV5xGYWTWb1XfbU5RGGomWgJX/43EUMKR2L2kXAO
         gJnGTiC2q43yrhKRmtIjwklPjFPX2Wl9AUiazUPVJOwpuUgwhBOqOW+13f+CE0cmsAQs
         2xOwV+9SmzZAlwCzyyQhiwT813b1ScsnSTq1qQPcQAbYOiZ0mWxcCGKhufKX4u7DErbk
         BJytlxkmOjWGJpArCouNDlEWGhyXJqRx0jeLTeIx4/lY6oca5JcLByIZAI5K8TVcExFY
         S70g==
X-Forwarded-Encrypted: i=1; AJvYcCUqu+Q76kV+e8DGnwdJioPKj/6VWw3bDeP4basqOS+lukl6IvWXd3PA8OpPUR/F9hLD9DL0Ax+WsuMmqXJlHSNU04MnV7X3ov+o
X-Gm-Message-State: AOJu0YzG982yAzR/B+4aMEs3IPViCFks43SPoLdkO73w0JXYBk1VkD4D
	4hZWzwYOQ8zUnxb7mJsJA/8xFvo0ChTnfe2oflkVz7zA3pz9ImF4IlH/ACkgOuk=
X-Google-Smtp-Source: AGHT+IHyAxC2Nha5nCXqGrQwGsjBWpEQ/9fhdptsCohMGEbhWFkiXJ6u69AXTVBFM4Ztj6ZVAZZT/A==
X-Received: by 2002:a17:907:7248:b0:a4e:4350:3b3a with SMTP id ds8-20020a170907724800b00a4e43503b3amr5048203ejc.60.1711964695236;
        Mon, 01 Apr 2024 02:44:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id ef14-20020a17090697ce00b00a4e44f724e8sm3060972ejb.186.2024.04.01.02.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Apr 2024 02:44:54 -0700 (PDT)
Message-ID: <efae80b6-a0c2-4db4-b42e-83fb61eb74b4@linaro.org>
Date: Mon, 1 Apr 2024 11:44:52 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] mmc: sdio: store owner from modules with
 sdio_register_driver()
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Arend van Spriel <arend.vanspriel@broadcom.com>,
 Brian Norris <briannorris@chromium.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com
References: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
 <20240329-module-owner-sdio-v1-1-e4010b11ccaa@linaro.org>
 <20240331203729.GC4116@francesco-nb>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240331203729.GC4116@francesco-nb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2024 22:37, Francesco Dolcini wrote:
> Hello Krzysztof,
> 
> On Fri, Mar 29, 2024 at 06:24:31PM +0100, Krzysztof Kozlowski wrote:
>> Modules registering driver with sdio_register_driver() might
>> forget to set .owner field.  The field is used by some of other kernel
>                              ^^ double space here
> 
>> parts for reference counting (try_module_get()), so it is expected that
>> drivers will set it.
>>
>> Solve the problem by moving this task away from the drivers to the core
>> code, just like we did for platform_driver in
>> commit 9447057eaff8 ("platform_device: use a macro instead of
>> platform_driver_register").
>>
>> Since many drivers forget to set the .owner, this effectively will fix
>> them.  Examples of fixed drivers are: ath6kl, b43, btsdio.c, ks7010,
>        ^^ and here

Which is correct :). Double space is on purpose.

> 
>> libertas, MediaTek WiFi drivers, Realtek WiFi drivers, rsi, siano,
>> wilc1000, wl1251 and more.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> My nit comments are irrelevant, but given you did the same twice I felt
> like letting you know.
> 
> Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> 

Best regards,
Krzysztof

