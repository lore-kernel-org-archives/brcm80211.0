Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275461CAAF
	for <brcm80211@lists.linux.dev>; Mon, 19 Aug 2024 18:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724091000; cv=none; b=rtIsM3lXVM2AqMsVhQE55fOb63xcF+mgksa/2iVmY+QlUV1TcIYmc6r+6+mLT2JaV0vyXoS+fNlWP86tR1KfLyfCAy0atf0Ds4Jje5TJ439Et9bfXZvVEP1QwufGb7if54GEwi/w9ii+pURSbUDH4tiJtEIBYjdpyXiLEBKGY0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724091000; c=relaxed/simple;
	bh=63+2QdlkyCN9L4q2CWGrCg16BE2JGVrtWcOW4JVfiag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XiJUGb2+fn2r/hzCqWkdeKdFoK/6l7tYOoN+F1VhBNayDwyXrTV1fwol7GgoUItJrQjqYavgr7KYzBgef7um/55g2TOdm6FBy+WagbOEZzR7ClCtzIdDPhUbpbc1dZjnaEg4RL2NFn9pAdWuZ7B/hxm5ijEVrII7Ghoc5lyMD30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWoo3kn2; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWoo3kn2"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-44fdcd7a622so24961621cf.0
        for <brcm80211@lists.linux.dev>; Mon, 19 Aug 2024 11:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724090998; x=1724695798; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J0LwJQr3msiysrr5pQWOHrBaffwI03B4P+ZJn5xGSP4=;
        b=eWoo3kn2hMgIc1lLiDAntVfuJ9kteTIMokya+zREefX4WC/erGTQWGoVXbbV9UqcOU
         +M9W9t2ndxdZdDkO2g4vwuybTK3WOe6tAqYtFiPGkmx4rUbjYAXZIrWlQSCnKv5QtPy6
         /e07qWXOY0nHGa2J14CAbLDs/0kO7tWXjDBoa24WEwsuWYnfjgEAGZ6oGKXUa2s9hI4+
         3hkMSOvwEJAhovWMCy+qskmBhUjTQMlq9QK6jdngtP7qcbq5eZFMZkVnj+D6ZxTDJe8y
         7E/ap3A1CVw7tkr9ag6mi+eMP32VsL2luiRic6zQ3xx8uag0QOGtWMrXhCnVyE0SNGW9
         YTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724090998; x=1724695798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J0LwJQr3msiysrr5pQWOHrBaffwI03B4P+ZJn5xGSP4=;
        b=nTeyHkyDS+l1QX3/HvnNfolctvnnHpcoqMH6cpKzAMlR1xLS0rSw+8tA0c9Wp0K0SM
         voTrqiDcCmP2lB/0CdE7/VLMjKTg03ZEztG8s3GFgpU0jovYYFzxUZZdMcQ0gCfLJMP+
         0f/Ux1+sKMqghsCc9sUKnkN9XT/7Ml5PbU3U1v+zr3Fv0nTeXIN+IDQcrVFYllvxivM9
         eswo5/GXu0TO4TKrlEybdhAWd/3Lv+LkI2mJrqowQgfeEOetioKk2BJHVTSY2XaX6of/
         emRivel00vdCSn+76+c2Z+uYClkdh5id1CtPYA5/kHk+qyzyk52AdTmrkYWg+2B4ZgtH
         629A==
X-Forwarded-Encrypted: i=1; AJvYcCUixLq5qA5vkGatRaef0tsH/fUFDcFqdRW+vltcJcTE29DqIpN/IBZA3+q8V1XuXgmw+lKpbLNHIV+k+M6uc6XI2kLLIh+13xCF
X-Gm-Message-State: AOJu0Yx6cCY6tu8fqh67zADR3XWRU0hPnrFwnpoJwRP9lLkCNDy0umiR
	5BaK9XprfBabH1ZNiIvJZ/1pNnfvwyrGIReQPZkRLL63xFR+a322
X-Google-Smtp-Source: AGHT+IH3+QlTCvvPI2bIAaqp1+Yqeb33oJ1jrQ7ZGCg2XGiyOZJlCc77gjXxJdooZTP+muRDaCc+cA==
X-Received: by 2002:a05:622a:5913:b0:453:17f1:eb8b with SMTP id d75a77b69052e-453743a96a9mr155808021cf.43.1724090997863;
        Mon, 19 Aug 2024 11:09:57 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-45369fd9e9bsm42344461cf.13.2024.08.19.11.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 11:09:56 -0700 (PDT)
Message-ID: <b04c01e5-3e60-4b0b-8984-9d6e0782f5af@gmail.com>
Date: Mon, 19 Aug 2024 11:09:50 -0700
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: brcmfmac: add support for TRX firmware download
To: Marek Vasut <marex@denx.de>,
 Arend Van Spriel <arend.vanspriel@broadcom.com>,
 Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, Chung-Hsien Hsu
 <stanley.hsu@cypress.com>, Chung-Hsien Hsu <chung-hsien.hsu@infineon.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Carter Chen <carter.chen@infineon.com>,
 Duoming Zhou <duoming@zju.edu.cn>, Erick Archer <erick.archer@outlook.com>,
 Kees Cook <kees@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mathias Krause <minipli@grsecurity.net>, Matthias Brugger
 <mbrugger@suse.com>, Owen Huang <Owen.Huang@infineon.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, brcm80211-dev-list.pdl@broadcom.com,
 brcm80211@lists.linux.dev
References: <20240818201533.89669-1-marex@denx.de> <871q2ky3zm.fsf@kernel.org>
 <1916b572558.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <c95f64f1-3ebb-41ca-a935-51c1efa1256a@denx.de>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <c95f64f1-3ebb-41ca-a935-51c1efa1256a@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/24 09:17, Marek Vasut wrote:
> On 8/19/24 5:52 PM, Arend Van Spriel wrote:
> 
> Hi,
> 
>>>> Add support to download TRX firmware for PCIe and SDIO.
>>>>
>>>> Signed-off-by: Chung-Hsien Hsu <chung-hsien.hsu@infineon.com>
>>>> Signed-off-by: Marek Vasut <marex@denx.de> # Upport to current 
>>>> linux-next
>>>
>>> The commit message should answer to the question 'Why?'. What's TRX
>>> firmware and why do we need it?
>>
>> I looked over the patches, but did not sit down to comment on this.
> 
> Thanks, it is real nice that someone who is actually familiar with the 
> hardware jumped in. I only upported the patches from infineon downstream.
> 
>> The TRX firmware format allows multiple images and possibly 
>> compression. Not sure if Infineon is using all this functionality. 
>> This is probably needed for 55572 device support (patch 2/2). Turns 
>> out this device has a bootloader that the driver has to talk with and 
>> that is probably where this TRX support comes from. Not something I 
>> considered to happen for SDIO and PCIe devices. There is always a 
>> puzzle to solve ;-)
>>
>> Also noticed a random seed is provided to firmware. This already there 
>> for apple chips so it should be looked at whether that code can be 
>> shared. I will follow up.
> 
> I did notice just now there is some TRX support for USB broadcom devices ?
> 

TRX is a format that is also used for partitioning flash devices, so 
there is probably some room for making a common header:

./Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt/drivers/mtd/parsers/parser_trx.c
-- 
Florian

