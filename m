Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478201AE846
	for <brcm80211@lists.linux.dev>; Wed, 14 Aug 2024 10:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631977; cv=none; b=CD8zr1B/gIUxgoSKydE4P7v/reIkdebniVP/VudIQNdhNWW7ftRdnykdd8g5hPBLF1fLA0uSuIoTQQxrS1KoqcFrtfkiEMtyAsHVPrcHT66a8hizwbKXXAt8cztlMn2OnY65WuyoTy9tLQlopKChfssHAtDpnI40zlAg3bGG7GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631977; c=relaxed/simple;
	bh=++bW5wMefnS7yJM5ubwMFA3JD9os0eJ2KTHGaw/AzjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhuLD+7UFXg/7JY5Wv7JoRTssuaoyU3XfZeJdIPicoOliQ2FNQyxPtyjBPpf0NB7HF32q1wjYELPNW36Iiv9UeW3VNaDmdZVkpSdFPc4kAgb8sK+VNecUTiCdwR6JNSLu/ixsxwxm7N0Z/S8ol/REJjCf6zl+NYGdgpu0QYwQyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dVcxTT68; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dVcxTT68"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-36887ca3da2so3167222f8f.2
        for <brcm80211@lists.linux.dev>; Wed, 14 Aug 2024 03:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723631974; x=1724236774; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6WRMEt7FBWJjYyyscCC3U3OCHTs2LMcI2PM9S0kbD08=;
        b=dVcxTT68oj6+6Z3ElWt+xFPsIreP+Q2y5letn0kUKMQPmG1jE1BnAujp8jRnjpjyjE
         40Hi8HmlmbS9OgVKSXI88OJ4IrmcLmFBy437x6HfANs5dP78tD69Lxnszl5RY9JF+2g+
         4nRj+u8rlaTvBM8AbuLcrNNFBYRpaOWMnNE3yHFMN2mcmMGzv41KQ5PRIe3lQaUSb1Rk
         aBsrzZMutAJ8eiAGDMnft6mIq2nq4cK9C+CpqK0i19rZm4wi6udeshk5syM7CgP2N8hS
         pB0WQ1Ags0JCtvmHH0eTT8s93aI3RnIEQlRbcV2vesXaZjs8S8k5APQuKdtIp0dUyABg
         0z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723631974; x=1724236774;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WRMEt7FBWJjYyyscCC3U3OCHTs2LMcI2PM9S0kbD08=;
        b=u5euje7df42M/6tIpQrCWVCofEHAN0UcxjP75LSxRMJzY6N5wyJxLpIJy+m8A2QMSM
         hAL3iMdNdKMFsyLl+6bEbzacjhqDrRl4mo5zNC9H5BpIoq01nBQ19BMRGDU/IirYrtEJ
         l4AxLrV0ZNB14wE6hzs+tSMZ7qwyv9B40iRvGxzBouyCNkuDHkPoXHCzNhx/VYxaDEFG
         zJfn71ha1Mw2xG29ZbwqLB3AybIjCPIhiQj28jMZlGtefA9UVq7CSKbIFVgQUkfoEkf3
         dTXn4meY9+/igUbAd5qea97EKkRFohEm/5/xdz/FdWus4BPZ0F462JAmWrtaj/oLpzw9
         5gdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv0qbKYhJzLhcJgi//KOmbMr/Be2RVlXPFk2YxQrnBcrXcn6XHcmSoZmyJlPf8hypp7nCEGqyWzvvQMmWtgSX+xvBpEX0o9stw
X-Gm-Message-State: AOJu0YxI7Oo96FBz+PAkf4Vx4GkUGJcbyfOPle1RJI4eNbGCXQpJrGgk
	hnCZri8ZTD82kJHoQayen3SxaeLUL6D/WvYXh+/H6cYBbNJgh6hZAyEa/epEKAc=
X-Google-Smtp-Source: AGHT+IEsFnMkEPMABflOWSpHSTdZcGDUv5V3RMUWkg8aYLGAOnolNRBF80iFXPk0KvmcXBKPYRU9EA==
X-Received: by 2002:a5d:5012:0:b0:36b:3384:40e5 with SMTP id ffacd0b85a97d-37177786e4dmr1476575f8f.24.1723631973511;
        Wed, 14 Aug 2024 03:39:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c36bcf6sm12456115f8f.17.2024.08.14.03.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 03:39:32 -0700 (PDT)
Message-ID: <1e442710-a233-4ab2-a551-f28ba6394b5b@linaro.org>
Date: Wed, 14 Aug 2024 12:39:30 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/5] dt-bindings: net: wireless: brcm4329-fmac: add
 pci14e4,449d
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jacobe Zang <jacobe.zang@wesion.com>,
 robh@kernel.org, krzk+dt@kernel.org, heiko@sntech.de, kvalo@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, conor+dt@kernel.org
Cc: efectn@protonmail.com, dsimic@manjaro.org, jagan@edgeble.ai,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 arend@broadcom.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 megi@xff.cz, duoming@zju.edu.cn, bhelgaas@google.com,
 minipli@grsecurity.net, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, nick@khadas.com
References: <20240813082007.2625841-1-jacobe.zang@wesion.com>
 <20240813082007.2625841-2-jacobe.zang@wesion.com>
 <1914cb2b1a8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <e7401e25-7802-4dc3-9535-226f32b52be1@kernel.org>
 <062d8d4e-6d61-4f11-a9c0-1bbe1bfe0542@broadcom.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <062d8d4e-6d61-4f11-a9c0-1bbe1bfe0542@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2024 12:08, Arend van Spriel wrote:
> On 8/14/2024 10:53 AM, Krzysztof Kozlowski wrote:
>> On 13/08/2024 19:04, Arend Van Spriel wrote:
>>> On August 13, 2024 10:20:24 AM Jacobe Zang <jacobe.zang@wesion.com> wrote:
>>>
>>>> It's the device id used by AP6275P which is the Wi-Fi module
>>>> used by Rockchip's RK3588 evaluation board and also used in
>>>> some other RK3588 boards.
>>>
>>> Hi Kalle,
>>>
>>> There probably will be a v11, but wanted to know how this series will be
>>> handled as it involves device tree bindings, arm arch device tree spec, and
>>> brcmfmac driver code. Can it all go through wireless-next?
>>
>> No, DTS must not go via wireless-next. Please split it from the series
>> and provide lore link in changelog for bindings.
> 
> Hi Krzysztof,
> 
> Is it really important how the patches travel upstream to Linus. This 
> binding is specific to Broadcom wifi devices so there are no 
> dependencies(?). To clarify what you are asking I assume two separate 
> series:
> 
> 1) DT binding + Khadas Edge2 DTS  -> devicetree@vger.kernel.org
> 	reference to: 
> https://patch.msgid.link/20240813082007.2625841-1-jacobe.zang@wesion.com
> 
> 2) brcmfmac driver changes	  -> linux-wireless@vger.kernel.org

No. I said only DTS is separate. This was always the rule, since forever.

Documentation/devicetree/bindings/submitting-patches.rst

Best regards,
Krzysztof

