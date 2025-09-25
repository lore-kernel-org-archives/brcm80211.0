Received: from mail-io1-f99.google.com (mail-io1-f99.google.com [209.85.166.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4274C319865
	for <brcm80211@lists.linux.dev>; Thu, 25 Sep 2025 18:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758825070; cv=none; b=AsMlXj6ctie0OZDd/rl7JiGUFbuFPWf6m2zGET1vrHYZpPoCc7Q5O0qSwQdzu8Y1QJzQhL07mUkPQJZloBecfOkPSMU268z4BB3KYo2QSO+evKV0zW3+xWGD/pMF2GO+iJlSk8pei0ZEMbUczHfM/ho9bsoIxMPFXziPGKfvIyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758825070; c=relaxed/simple;
	bh=U2Y1oZnw0CPSvphNGIRZ/c0Hw/FN3c04/zntgc90mKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ip951ZjA0xaipBeMoBw1pqUUFX0kdNtfi6SD6N+JsEGQ8duw0wMNkgrnuV2kRuzyrAOV0z9MD4uhSQ2eoId1K9WT/Jtg40kmt0vrrUs5TU7O9tQn8FPt8JC6pSXjEJVLarboNkSeJ2wm7m2uxUNgLy4fGM3H9va9PaQbAQLGyos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Dv5/3IS3; arc=none smtp.client-ip=209.85.166.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Dv5/3IS3"
Received: by mail-io1-f99.google.com with SMTP id ca18e2360f4ac-8b0055cbd0fso107224739f.2
        for <brcm80211@lists.linux.dev>; Thu, 25 Sep 2025 11:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758825068; x=1759429868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kdZ7JXoUq4xQim4IeeTfkCOZr7doJLlGQb8qr7xzIoM=;
        b=FzO/qVu8K9NLMZhutr4UCf2fH1XwPK+kfZgpdMDMfapDsd/Ie98I7lJM+/s94A8bW/
         c4z4rtyEHmnEfBHuiP06Wx4P7e3XJP2UA2VShwCrcyakJ8uvyC9nqjdk/wr33Y4K4LA2
         SwkF5LY2JtD/yeYJqkCFGD5c4qtQIKXhiMCAbYxujvUi4Wwt18RbNELtJcntjc2O0/rp
         NHLqYMvBAOtiYdzVLkON93ABBUop1+GzIxb0AhhHqlHOCoICCXolVLYhxpam3cPN3Itd
         q7njMWzhWqr19/xSLlkpDMYEJL0rTInZ3Q+bGgebBj329Ju2lgn9EBe16/hb30NV38EL
         raEA==
X-Forwarded-Encrypted: i=1; AJvYcCWJV6dGAe7jgMadOdRYsHUqTwv3YEDzJPEMgmV2eWLOQ2rJrh0x9TEN1ihemMiXQQ75Z/nsYP7Luxk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGxESCUpZJdOzCnsDGkiaOSs4/bpsRU4epqxuojzF4eOWN5CPT
	sRaRWOnPeg3aGhX0qYkAsZ9iLDEwyhj/Nu1gqVsdNmZjQZB85qUSFg3j2BcX/rZvuVJzVVkDxlc
	Tl6YnOhCrD8fKi0rDdVBCtTgh2uGJSBgEFfbhtvNE6iAlSRrtDJ3rTXyYSeKELVfYGWlQ4NNuqi
	s8gEqBTYbISsbHMmligu6pZYlm/OvXRUjDpszuWOrXj+MkC1dgMYI18ncnx8elZT0qyB7v/pebL
	R+13iXnW/uYkPWpwfm+3A==
X-Gm-Gg: ASbGncttT4xGGYHLx3aXkpuVjbV/j30c7C/8d0WWGbvsa4KVz/FnMlTOPAwG/3qMAkH
	ZoNAH4RgINK22zVykcT6D7Q5P6D6YRdxASfDXeIYsWXpp3AdAV7CQ/0tnpAtR7AnmVm9HecwF1q
	GJxvRIOdENVHEEc+WxC/dIKU9srM8e4Fm1ERbprCusBqZu2JlNYdSGM4v25zqx/feE4A5vGAS8I
	dG1X+mEb7RpWSuCKr7+8Qh6veA2aKp6M+oXEiJyFiY2LA2Z3nKmHv9rpUq9zVKNw+zhcdp+KnOU
	ZG9AlqbhzeRXRG5dCxeElpWjrkhC8snPSCj1e/00CzIHsgxj/0LD3uv0Vt6vpS01DYnipMCkn3p
	wHp3YaYrih07EvsuMkZgfv7KKkUjlR7YQYlb3MclexhFhCyeDH70EdAu/GfuFgqNu1fWdrYyFgT
	u4vVxIpA==
X-Google-Smtp-Source: AGHT+IGVHMeIyFqdWQJC/YITVmMeLWOCieM1ZbshogRQHtj+Yshh6zh1It/SDjt9435k79E+06XPyJamsxev
X-Received: by 2002:a05:6e02:3702:b0:425:951f:52fa with SMTP id e9e14a558f8ab-425955f259amr79696405ab.14.1758825068196;
        Thu, 25 Sep 2025 11:31:08 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-425c02658acsm1615535ab.40.2025.09.25.11.31.07
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Sep 2025 11:31:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b360d0224f3so143255166b.0
        for <brcm80211@lists.linux.dev>; Thu, 25 Sep 2025 11:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1758825066; x=1759429866; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kdZ7JXoUq4xQim4IeeTfkCOZr7doJLlGQb8qr7xzIoM=;
        b=Dv5/3IS3wiyHr7TVtojRv2iL6xjgwJ9XHTQpi2OMQD8LzHZtHMkLHypCqlivZ99l8O
         hco2B7CHdJXtfCbkCENjj4+NyvjCo/8xJFhCCAjhxBbE5q4/ttpK0pLg8DWWzmZnFLtr
         IWDBKOfnRHrrO/zSrqjrkPxu/rQqZHEk6Ws6s=
X-Forwarded-Encrypted: i=1; AJvYcCXcovqs/T+GD7Jg61L2ZWUrYb1rhu9y6M55rf7CszOwsf+lZucjbCG/ZBttwYvrkcfsIGnEzr8UVTA=@lists.linux.dev
X-Received: by 2002:a17:907:3e21:b0:b34:99e3:3a88 with SMTP id a640c23a62f3a-b34bbccf844mr430955266b.58.1758825065686;
        Thu, 25 Sep 2025 11:31:05 -0700 (PDT)
X-Received: by 2002:a17:907:3e21:b0:b34:99e3:3a88 with SMTP id a640c23a62f3a-b34bbccf844mr430953266b.58.1758825065213;
        Thu, 25 Sep 2025 11:31:05 -0700 (PDT)
Received: from [192.168.178.137] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353fa65880sm213136266b.45.2025.09.25.11.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 11:31:04 -0700 (PDT)
Message-ID: <02ff0c6e-f2e5-450e-9666-3ce8b8404f86@broadcom.com>
Date: Thu, 25 Sep 2025 20:31:04 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: brcmfmac: driver crash with iOS 18.6.1, potential DoS
To: Hsien Chou <s311332@gmail.com>
Cc: linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 brcm80211@lists.linux.dev
References: <CAE3HL_yv8t1Rkd+jLfQMkc3YrNONQp0pRFESV+v92ECf_+7Xjw@mail.gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <CAE3HL_yv8t1Rkd+jLfQMkc3YrNONQp0pRFESV+v92ECf_+7Xjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/24/2025 4:53 AM, Hsien Chou wrote:
> Hi Arend and everyone on the mailing lists,
> 
> I'm reporting a driver crash in brcmfmac that can be triggered by an 
> iPhone with iOS 18.6.1 or newer. This issue *allows a remote, 
> unauthenticated device* to crash the Wi-Fi driver, leading to a denial 
> of service.
> 
> The full details, including complete crash logs and a step-by-step 
> reproduction guide, are available on the GitHub issue page:
> https://github.com/raspberrypi/linux/issues/7033 <https://github.com/ 
> raspberrypi/linux/issues/7033>
> 
> For a quick reference, here are the key details:
> * *Affected devices:* A Raspberry Pi running as a Wi-Fi access point.
> * *Trigger:* An iPhone with iOS > 18.6.1 attempts to view the properties 
> of the Wi-Fi network.
> * *Root cause (based on preliminary analysis):* The driver panics, 
> possibly due to a malformed or unexpected frame.
> 
> Please let me know if you need any additional information to debug this 
> issue.

Having the kernel .config file from the Raspberry Pi would be helpful 
reproducing the driver build. Can you provide that?

Regards,
Arend
