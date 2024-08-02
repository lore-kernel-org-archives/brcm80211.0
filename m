Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BEA15C12C
	for <brcm80211@lists.linux.dev>; Fri,  2 Aug 2024 17:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722619733; cv=none; b=GfW1ZeqKocQz/d4wBRKimrQXb2wnjAGuH4T5CnzgpnJ6eTUyJ9JrAJGEUfOSRx+QBmNarIrgQ9QgqdWzvH7tWcmy3qUJYe2BgNPb4hB9UaeswjCgTWgWVbkUdT+PMJxVtrI1eiRAiT9dx5WiOC2IfV6+NNDnXUR0rtau8jXAeas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722619733; c=relaxed/simple;
	bh=ufZpM9JltkFfnggMkkjgC7Um3zuQKBWRiOgCmbbazj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GOyrNFG/ZZU6C1/nBONcXLnZ2EXfh+tnDz5v8ZKWDbFUCmQSiUREdn5YOoMZy0GZ6tbJ0V6AuGcOIvjbw0flPTo4+W701FFXrXM6S5rtd9RbIFuYU43EcKKcOwCXESN0c2ZIXGfneoEdfvfft30Um5dBRNVSUJaEqMWmGWT/d14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=V0EpGvC3; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="V0EpGvC3"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7093d565310so6658414a34.2
        for <brcm80211@lists.linux.dev>; Fri, 02 Aug 2024 10:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1722619731; x=1723224531; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Loq2nUhoV/a/FTrOZuQKs+xfpnLLREOs45RNFVOD5TI=;
        b=V0EpGvC3fMkH8bUbHGxOM++PNQMZxAlFPlLfRImUm0tD+ly7j4+f9j0wHaIMqPqHlI
         hpBy3BZVYV6eD0XPyluJy9quL7N1hIWYL4cIJU4uH+lvOfIsqIwesgreCtPnbw4GMboj
         50r6wjqJLyAk+PvIszqXUbw0hz/n4J0CjFavE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722619731; x=1723224531;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Loq2nUhoV/a/FTrOZuQKs+xfpnLLREOs45RNFVOD5TI=;
        b=UwNdtePuAQaPphhe4R8t3puM4offU+opNs4begaAWRkSN1QQ/nKqj3B5yyCXtkqhf8
         /iGyXij4dUZMVAIXDLn3F/6YrQ2RFLFjLUzjrfdwzJnhC6J/7qB0TYT7tMzFT8QmsT2b
         Tgb7uzn4m9hh3NdlO4ZEXQJhxzPqdrZdP4OXL/zFWOgiZPwnRhdMYYKMAkAZnRmS/a15
         cuQ8osMI5kqJeGLi8N+rtCyKXsIPRtEX6vwqxwkQRt4hFj9S+4idF3/XibZ1xdh6I2s/
         0OoAGkkfzC4Zfa4nRIyC6XhEIpTz7GYXep+st8jGKGhoxCXn1mCfhxkx1d9tWLami0Ky
         NY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVjz3qMHOyAw5eSiQHh7NJP/0tHUVqGQKkhHv/Qs0hellKlNyXegT5tnAUVVcTqwVckbPiQSzICRtBUujsLE1OgG8VsN2qOydc
X-Gm-Message-State: AOJu0YywkbfOZ6Vh72y5tt4wYWypVvjMSzFy5LSvCSWlFSqptCPMY7Oz
	Cgb1A1h8NPxpevhcmOxO8WbSTjV8XTe2I9XE7vvztO6CuT+BSGRqylAAomfmvw==
X-Google-Smtp-Source: AGHT+IGs6KFzCe98hzuwG7TnKln/IZKnkWDmWm72K6VV/kQWhhHTVpj5FW0jnR/uRlunbLa+WUjiAA==
X-Received: by 2002:a05:6358:419:b0:1aa:c73d:5a94 with SMTP id e5c5f4694b2df-1af3ba46a9emr369433055d.16.1722619730724;
        Fri, 02 Aug 2024 10:28:50 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c76f6e2sm8862596d6.14.2024.08.02.10.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Aug 2024 10:28:50 -0700 (PDT)
Message-ID: <f2cc346e-63b0-4fb7-b954-5dc3e597b7e1@broadcom.com>
Date: Fri, 2 Aug 2024 10:28:46 -0700
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT] wifi: brcmfmac: Add optional lpo clock enable support
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
 Jacobe Zang <jacobe.zang@wesion.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 Ondrej Jirman <megi@xff.cz>
References: <20240802083400.166753-1-arend.vanspriel@broadcom.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20240802083400.166753-1-arend.vanspriel@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/2/24 01:34, Arend van Spriel wrote:
> From: Jacobe Zang <jacobe.zang@wesion.com>
> 
> WiFi modules often require 32kHz clock to function. Add support to
> enable the clock to PCIe driver and move "brcm,bcm4329-fmac" check
> to the top of brcmf_of_probe
> 
> Co-developed-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
> [arend: handle -EPROBE_DEFER scenario]
> Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>

This looks fine for a cold boot case, how about handling suspend/resume 
where the clock might have been disabled, do we need to deal with an 
"always-on" Device Tree property as well as whether the device is 
enabled for wake-up or not?
-- 
Florian

