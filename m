Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69589158A04
	for <brcm80211@lists.linux.dev>; Wed, 28 Aug 2024 08:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724835052; cv=none; b=OYOPcWuTf7Sn0gfCG9PxQ6o5ZxxeIW9uXrYBCXBYvPt8U2UEzo3cHcg5h6tRiJKcw/Y14/LtvrzALmNl6Frvss227u+zs2mWsQW6eATGO1MAiAhasXrIqAOB8tkRm4eJHVtL8fxsfEo2a80W2b1hyPp5SilPYOXrOEqKmqvtWdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724835052; c=relaxed/simple;
	bh=c9g+rp5fVpjbqkIfSqp3slDFY2jz+ztPwAXbFeXQ8t4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C+DSVJlvTjy7PA306HcWrQ8747f6YLmkmP7P6RmxHa8O34T8bTLqa/8Eh0kYifWNDiHzFoofcpz/8mcIYHO5JMwzfXOrIVAGg54OsdkOHKeBjP0J0MceJhGhmDAyXy4u/QavsH0/ZQOwLRNB9u8lrZBWznDkzv6Hfy+z5CQw15A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=B1vURlFs; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="B1vURlFs"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2d3d0b06a2dso5313981a91.0
        for <brcm80211@lists.linux.dev>; Wed, 28 Aug 2024 01:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1724835050; x=1725439850; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=shRY5stjFi+JLGkJ+y51t2hwTW4qiG9k0qtRydA83MA=;
        b=B1vURlFsWltlBNjTi0f03vQBnb0KSKx3y98mg63XHjalzIBJJ6jcLaC8DPT9DJO13i
         sDs79ZR/E0CUrKub1DLSccOVd3MQOccjpQUJ0txE1BaJRvQaxZI7/sVUGg0v/voAhBEU
         Wwvv8utr64Dps7E2G/qqzqtS/q1PnVTnpgrHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724835050; x=1725439850;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shRY5stjFi+JLGkJ+y51t2hwTW4qiG9k0qtRydA83MA=;
        b=xJz7uja1OKjpkvO7nyElKg3zu62ZHZJH1o6JYPnDi0+q7jX02mK7YFPYgdUg/eNJ2Z
         2FnLxlY6T5wyFGKhWZAf7kAG1LrGIUMRdtJ/kqkA4rTs4cvj75bZahytxUSooPSwmW6N
         MDNsZla+qzkH5FbO3zSImV0ItWByS/gcjAwdMEM0m0lDxSjdQ2zWe7NCzT7m9m9GWpJY
         ccrofvsRdgQ6BnO3/brt83f5dIUC+6t7oOMx51Ijx48nG8BXsCyrXyf7KdY6drzII/uu
         9cFUptn0gAujxgsRYTvOkU4B3Z7O5N2F/qUkKCMLCwe4NVmbp5+4Np0VdmDcZkfQfELo
         jOXw==
X-Forwarded-Encrypted: i=1; AJvYcCUOed7PKExc8M+9lwa8UWeYtcFIdB3xG/hDIN7QyI1DrHEqH4Ki9IG5gwXdrEGupF7IueAko5N5iq8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9KXJGdOQ85LWuJI/59zrY35P/7vv5U8XHDJLJIHwBZ2scGfbA
	QzaG2nN22caKWTI1XnsorsxfMFjvAbS9N4Hu8PI05rv5eG5CBKJGhe3vVLliyQ==
X-Google-Smtp-Source: AGHT+IGq6FJZLa1EEfe8Q6XnN8zV+OXKNWera5wQWyN99473BRSN9pCh6Zwq68D6ro5+GxN5M0vYQA==
X-Received: by 2002:a17:90a:de8e:b0:2d3:da82:2728 with SMTP id 98e67ed59e1d1-2d646d5eba9mr15834309a91.41.1724835049454;
        Wed, 28 Aug 2024 01:50:49 -0700 (PDT)
Received: from [10.176.68.61] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d844640ab6sm1127894a91.42.2024.08.28.01.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 01:50:48 -0700 (PDT)
Message-ID: <22fdbe11-830a-4084-aa5e-1b7294f3a7fd@broadcom.com>
Date: Wed, 28 Aug 2024 10:50:43 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/5] dt-bindings: net: wireless: brcm4329-fmac: change
 properties enum structure
To: Jacobe Zang <jacobe.zang@wesion.com>, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, van Spriel <arend@broadcom.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com
References: <20240828-wireless-mainline-v12-0-9064ac7acf1d@wesion.com>
 <20240828-wireless-mainline-v12-3-9064ac7acf1d@wesion.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20240828-wireless-mainline-v12-3-9064ac7acf1d@wesion.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/2024 9:40 AM, Jacobe Zang wrote:
> Add "brcm,bcm4329-fmac" as fallback compatible for wireless devices that
> used PCI ID based compatible. So that can pass the compatible check in
> driver.

Hi Jacobe,

Using the driver implementation as an argument for adding the fallback 
compatible to the bindings does sound wrong. The most importants rule 
about the bindings is that it is independent of kernel and/or driver 
implementation.

Now this actually overlaps my patch series from couple of weeks ago 
which also covered some other existing DTS files for Apple platforms. So 
my proposal here is to drop this patch for now. I will give it another 
shot in v2 of my series after yours is (finally) applied. We can always 
hope ;-) That does also mean the compatible check in the driver should 
not be moved in brcmf_of_probe(). Also the Khadas Edge2 DTS file should 
not use the fallback compatible yet. I can include it in my series later.

Regards,
Arend

> Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
> ---
>   .../bindings/net/wireless/brcm,bcm4329-fmac.yaml     | 20 +++++++++++---------
>   1 file changed, 11 insertions(+), 9 deletions(-)
