Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0290418785B
	for <brcm80211@lists.linux.dev>; Thu,  7 Nov 2024 09:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730972300; cv=none; b=YLBkf7U8ZKeUh3ORBC/74rx7E9FDJO9LFiHeTx3cADtknGTDEk3Dr/7x7EX5pmtznFqCT7gGZA4KHaolFC1Q3geQnn0fu/1HOtWVL51KI0ANqwalcQrWesRsbb7OxTPpGA/nhJxGmpP6rz88gFN9q3qQKV276URtabOIZ6vsYJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730972300; c=relaxed/simple;
	bh=l3ikb6G7OffQR2iTEheiogELzdNFELxJ6ZzdzDBtrEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FtTy+POk7ojz29mFA9/Q/xcciL05Uwk+1WkQTr5FZkxcuCBu6W7RiRSjcJh+4tYNTtIxhUtTscDqTuZaZBN0LSrULmiFF4v8zKsX1m1GhcKnVRdNVWfq2xeQoLi/HcZIwLQS0MOeDFdEeeXCOP9JGx+26Lpp+/qut/k4Zs5vDJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=CI7o1dd4; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CI7o1dd4"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e3c3da5bcdso6393107b3.2
        for <brcm80211@lists.linux.dev>; Thu, 07 Nov 2024 01:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1730972298; x=1731577098; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MWRI5EJVkFvUGx6C7YJn+xRBNNFAvzP+Auq975y6ebY=;
        b=CI7o1dd4umSMeQ05ODT6RXmzQvyK+saagzgMmgQazjYiX5mqsCI/o+nIBsfQPYgsmY
         ruNGlmx2XsQXZGeth+ZW7Pu1mkFW2fih5D2k3HoR1G3IgxBX9d1kwGdp6DHI+HyLHaBE
         wEsFPGr5wn+4c1uPgZtkB9oREPGIeeKJQRaak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730972298; x=1731577098;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWRI5EJVkFvUGx6C7YJn+xRBNNFAvzP+Auq975y6ebY=;
        b=X49TXYLsOFeP9AH6CKW7d6T1Ap49OT3UO+Pw8qhdpKQPOalKdeWcUKCE+JHxH/fq1/
         cEtJlpDf9uPmzn49kCgkS3n4JctlnNtg28SmmSaLsj5DgoeiiD4Gg8Eoarm/dWW8bTWL
         m7B+8kNBlUJS2i5NALMeXu9zS4xxgxeNfZh1/ORz1OX6JrXNda57yjtINPuBVuyScLCr
         uhpUlJBv/D3d2b32lV/6VbuVeokM9DZ6thDBhQ9iYtFyq/P7pD/WxYX2rgGVW0aNiyLl
         dlaGto6hvBnt3eKH+1l8hAxmURcscaJlOxmQi9f9Ns2U4iUMat+6xWcL4Rsce/T3ecDr
         bXKg==
X-Forwarded-Encrypted: i=1; AJvYcCVbgNCqcFNyZGBLv5jClDw7ruFcpDFtSq5TgroQZTgdHApvqggQDZrjoR8OlE1W9+lcIIhs/j0U3LY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEuUO/H15NBIHUshsTM5yRhzmOHQaiH92WqokvRvR2AiZR8Lv7
	60Ns5RG0Uo8vbk8WXi0gY3wnTfGbwsgVebAXhS8/9uuamo5Hu06PClrQhLrhWQ==
X-Google-Smtp-Source: AGHT+IEg4zB9r4eKZAHG2EISGvc64OpTiaR4ghmMLpnW1RxREEGUdQgk1CXApcKl3AxBDAYGJUrviA==
X-Received: by 2002:a05:690c:6a0b:b0:6ea:cc1b:e6e3 with SMTP id 00721157ae682-6ead60673a3mr4487367b3.33.1730972297955;
        Thu, 07 Nov 2024 01:38:17 -0800 (PST)
Received: from [10.176.68.61] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3966317f3sm5583696d6.118.2024.11.07.01.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 01:38:17 -0800 (PST)
Message-ID: <8f8c6ac8-159a-425e-9d9b-b31c956f700d@broadcom.com>
Date: Thu, 7 Nov 2024 10:38:11 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>,
 =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 Loic Poulain <loic.poulain@linaro.org>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, Breno Leitao <leitao@debian.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, wcn36xx@lists.infradead.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241106170706.38922-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20241106170706.38922-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/2024 6:07 PM, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/net/wireless to use
> .remove(), with the eventual goal to drop struct
> platform_driver::remove_new(). As .remove() and .remove_new() have the
> same prototypes, conversion is done by just changing the structure
> member name in the driver initializer.
> 
> En passant several whitespace changes are done to make indentation
> consistent in the struct initializers.

I am fine with the patch as is, but it is really up to Kalle. For 
brcmfmac here is my...

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
