Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5449917B41E
	for <brcm80211@lists.linux.dev>; Tue, 25 Jun 2024 18:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719339794; cv=none; b=dxUVFKsVRgezl97SX6x/5t/YZbuP3tNq+O1EXPzQ38JFcIN/wFiStePO0ZqqcZNcMBfooy2pVEyMNA4h/wT+hFCxLGy0j5NbL9t2DzboxpdzkwJLaa8+osSnRCfXmQv3XYFB8RsQEgyT7+Tlr0GVhyPK/wkya0Z9ZppR4crv6GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719339794; c=relaxed/simple;
	bh=bPUh9nSGFtO2ZH250fsPH8AciQy/a+YeiaPMAijEL0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZq0NfHsOJC5lQVJFJsIYprxBtwwlAVLU7qwWz8edW+zgpJlIeHN+PoQkarerq5eMTUG4kwrdLa9L8M6wWiICROUc24aDrAgxI/RXFpwE4K7W7cOzEfK6qLITSMYVBawr09JTADZZK/FiS7oyO2zzOCAyM3mYNbx4aun46CACR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KswIZ75i; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KswIZ75i"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a724440f597so405638866b.0
        for <brcm80211@lists.linux.dev>; Tue, 25 Jun 2024 11:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719339792; x=1719944592; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YI+bpBZALTybzUwLfkVghT7njEcIxrhFjEkXZ3RLHB8=;
        b=KswIZ75iPonZITe3Ib1JrYPEdF6hqRp60qpKYPshIY/HLhQX+sNXx5r2tQgnpcgFr0
         r2y/cTdYSZffdS2SKumLyM/dBOY+B2oCz4j+fJuBbDEZU7PRogVvaA5oV6Ruwtx2tbEl
         Fa5gBndFh0nFAXc3BlKwbjQwoGOGDkLCW1sNcclcjdE7pE27gxV3L1Av8bhyObFlFEf6
         FjImNppczo131OmsLWyEM2EvUg39ieeOC6wUhBkrNihL0gWW2thFWSkjWJqJFJlOqkzp
         C8ILTTg4LB3vle8AAH7kOzOHudOpTAdtB1KnmoCFbrbAxGo81DlH4ZnInIGyCQ5c+L4A
         uJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719339792; x=1719944592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YI+bpBZALTybzUwLfkVghT7njEcIxrhFjEkXZ3RLHB8=;
        b=JqYHmwRxmtZpy4eqIp9ve4W9n65hx3zCJYkgndqKanw+5XNmRNHE3WD7ec6E/K/gqu
         HkoJkID/65ERe/yU1hT/VYbYr/k/ZgDDuUEEW1o5P5wFHPiks6soLkAd3GU8o4K8Uwrd
         3sFtMW1tPP8SVeKJB3jKKB5whUtsAyynYwP0dUulwr4DyWv3PNowzv+IPw21G/C6AWNp
         WbG6CY/+tKfFkKTGRLN7qSvn54jFbJ4vbPwHWQJa+ZVO5/mr4oRLP+sfKu5cge6ca7Rs
         kxtXIv5NXBUM1cQAHogw4xgnddvgmg1wgFuHNXQROMs3ak07utYQxeLES0adtwOptoVK
         mwvg==
X-Forwarded-Encrypted: i=1; AJvYcCVJNo3K+/MKg7ePzLOffr/vwZ+XaTT6gNR7Q0DYSKDLavxo9ePZOM4bCSZFYI1PXS7vekbpDEKvC7AuKWpDPK/xMjhY6F7mOpNR
X-Gm-Message-State: AOJu0YyDm7z8/22jN+Ff8hzAbZXWgoZHF7mFi7c0G6TPFvDwxa9kodM2
	ER70icVGbSjPspDt0NakryRrl1BhRDOLovZX6OmYLA9gCvuExoRO
X-Google-Smtp-Source: AGHT+IEVE9h75pyP6xYrOYIztjemaOBJkjZ5/GNfxxLHHYCikvn/gKAFsaiCv9uiZ89ZZ/jp3mE6Bw==
X-Received: by 2002:a17:906:f1c5:b0:a6f:73df:15d1 with SMTP id a640c23a62f3a-a7245b6deccmr512949766b.7.1719339791398;
        Tue, 25 Jun 2024 11:23:11 -0700 (PDT)
Received: from [192.168.178.137] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72557eea48sm227432366b.52.2024.06.25.11.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 11:23:10 -0700 (PDT)
Message-ID: <89f2564f-788e-495d-97ce-f1fa8a921d50@gmail.com>
Date: Tue, 25 Jun 2024 20:23:09 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] dt-bindings: net: wireless: brcm4329-fmac: add
 pci14e4,449d
To: Jacobe Zang <jacobe.zang@wesion.com>, arend.vanspriel@broadcom.com
Cc: kvalo@kernel.org, duoming@zju.edu.cn, bhelgaas@google.com,
 minipli@grsecurity.net, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, megi@xff.cz,
 robh@kernel.org, efectn@protonmail.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, nick@khadas.com, jagan@edgeble.ai,
 dsimic@manjaro.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240624081906.1399447-1-jacobe.zang@wesion.com>
 <20240624081906.1399447-6-jacobe.zang@wesion.com>
Content-Language: en-US
From: Arend Van Spriel <aspriel@gmail.com>
In-Reply-To: <20240624081906.1399447-6-jacobe.zang@wesion.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/2024 10:19 AM, Jacobe Zang wrote:
> AP6275P Wi-Fi module connected via the PCIe interface.

Repeating my remark from v1 series although I gained some knowledge what 
chip it should be now ;-)

> Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
> ---
>   .../devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml      | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
> index b9e39a62c3b32..fd22ade92210c 100644
> --- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
> @@ -53,6 +53,7 @@ properties:
>             - pci14e4,4488  # BCM4377
>             - pci14e4,4425  # BCM4378
>             - pci14e4,4433  # BCM4387
> +          - pci14e4,449d  # BCM4329

This should BCM43752 iso BCM4329.

>   
>     reg:
>       description: SDIO function number for the device (for most case
