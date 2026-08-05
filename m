Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B31B472F7D
	for <brcm80211@lists.linux.dev>; Wed,  5 Aug 2026 13:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938221; cv=none; b=dZkCj420h8saboZKleDD8hGgAhzfSRwKDSqQfmyc/jJuclU0/I4+INuZvHZB+i42QPBIVcEBQ1q2z2l4B8P27x08b7er6Lunk3B05iqjxSrmsEgbJ3i6BN9y+qmiqJwcKxBjgPPmN8/VVBSdWy9sNvJmj0obmP/FidD+Rlt6PYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938221; c=relaxed/simple;
	bh=diyEuWZHzf/RCzjjtbeq9XwF5mD+mihbuH8CpbkLkYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qj3/ssUEGGiHi3I/XHjT2amGE2OQ6JGRstofZ9321Q7ob8dho2p6JtWhnZohQIZ6LL5fmpKPwdntsjYgbPdsmsv5b7cb/WiK1s2IjmBvkJFTFc2RAk+jbq0CWXK9Qw4SLm1FUP3/3BAR2w1CcBMzlE/vWL8o8weBHte4lVkqezM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rH2nC91O; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rH2nC91O"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495590dde14so10841175e9.0
        for <brcm80211@lists.linux.dev>; Wed, 05 Aug 2026 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785938218; x=1786543018; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rF8eP1OY8L9QuXVHd7iT1kdFN9+aOh7P/1wr7uIkXmw=;
        b=rH2nC91OR6KE6J90gtZHAalFiy3G4jUOMXbOEEN6vZoKnm77/9aZ1Nt2EHTWiK4oOj
         1O7pmWNttxegG+8zCIiCOQPi7yxA2cpcYL6UrpMV1ZrfaWuxkrNITn6Y9VihSmuKpCn9
         WwVnFz2Era3nfHZamlr/ACECIyk6rVuV8cCsoWbJdN81khk54MISRsYcFC64B4yeoXA4
         uC1nTTlLyi9uhLOSgw0WynH/x4lBTVQEZk33T7SwrLWf4WDNCxpEQjqHiNMYYgkdwZbX
         cwSP6KfPLuI62Ke6nCMTj3gSB1e1+9xiUmt7uSyyCwKEb4lTqiB22OvQKL9tEMIYAdoz
         Ax9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785938218; x=1786543018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rF8eP1OY8L9QuXVHd7iT1kdFN9+aOh7P/1wr7uIkXmw=;
        b=UvBN54Jdo3GzIWq4Twifsf9HTwYceN5On2EHDR6WfpUZmVYLmpiZvE2uGqXuf7MmaX
         vZpc5617awKP4tI2QGvDVS4GhB7PouzWKXEkGExtZ+FWD3F3LEVFntPV2MXsqEri3PWm
         U1cfkVK+3zD2LTBEXG88Sc9X1ygTr/3zgbC3k12Xac5q98YZr+87cpAdjkN0iZ7RAjXT
         Wvqaz48j9CrEvYgetwPBg5tOYh8C0wIFfV+4pJVmw7NihAuw86wAgE2s53EXRM1cwxXP
         6hJYNgH/113Lpcjr0qxk0n5z+l/hmZkxCUyeLd2MvN5x3XAzF7bXzMI7S0MwHMnp5UxM
         496A==
X-Forwarded-Encrypted: i=1; AHgh+Rohmin/cFNZm/pzq5eF5l70odZKWYvT4uVkuzf7woaiHUfzmUtzAt2dfE0w9qYk290sqc1zqzTZeMw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+St5lq/TAwY5lrcN50gEn/LJpQ6Elp0dbMe8NoJXqBb7WK1NE
	o9zxiBmaB4Zu2zGc+0t+VIxKZ+ID7Gw6J7mvLOs6zGYAgCxgeuxQoGn/
X-Gm-Gg: AR+sD116hzGuOZDqALjSHofd9IcAjH/LMmuE+wyl/HPjsIA6S3DIPWihL6HHKN6/MXf
	oFZPvFY7ILJNAjkeSynUMYAv66ku6GsvxlQ9GbwHRcuS2foEkZ3BfxCFHDBXzo/XrafSXaXoq/d
	68qu34DUX5Llj04HZzkCIIy0fg6ONXm34tfDsKNM5MLZPiTsaGBbkvHNgSQdbFc6EQmdCm4oYWW
	4N0nj7nBop7E4gzJn1SoFDxxY9KWxiN8aOy+glL3oNjfc+/BFaAtF2NUw0fg/K+AAb0qBsGUMjq
	kmAL1NOp1hFNlQDjHrNEID1L7HVEQa9btKgTTYP9RUh+wQVu5aroTJj68PuEP2+eNha2nkbmhLJ
	BYIAFwRwqlVDKSYI2pH/+u3hrdSHLfPLDdsAZNNauYJsXycrhlmjd7ZdQOoTcUop9DpZ/z7nVGi
	Pu8AF9np167JKcl7dXFDIv5yR/CtYQmWxjnD8RcFoiDX9PkImfn+Qe1ZqRnRnu+wBB4AM=
X-Received: by 2002:a05:600c:1d10:b0:495:7a23:1eee with SMTP id 5b1f17b1804b1-4994e7ba86amr74594335e9.12.1785938217905;
        Wed, 05 Aug 2026 06:56:57 -0700 (PDT)
Received: from [192.168.68.75] ([95.46.73.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfda11csm8772460f8f.1.2026.08.05.06.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 06:56:57 -0700 (PDT)
Message-ID: <15ce55e2-c4cc-4579-811f-4c13e19bc6e5@gmail.com>
Date: Wed, 5 Aug 2026 16:56:56 +0300
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: Add support for BCM4361
 PCIe chipset
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20260804-broadcom-staging-v2-1-cebdc69e938c@gmail.com>
 <2dc55d93-544f-47ec-b349-c206f5414f22@broadcom.com>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <2dc55d93-544f-47ec-b349-c206f5414f22@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Arend,

On 8/5/26 8:46 AM, Arend van Spriel wrote:
> On 04/08/2026 16:07, Markuss Broks via B4 Relay wrote:
>> From: Markuss Broks <markuss.broks@gmail.com>
>>
>> Those are the required changes for the BCM4361 PCIe chipset support.
>
> Hi Markuss,
>
> That is a brief commit message. Maybe you can provide a bit of context 
> for this patch answering these questions: Are you using this device in 
> some project? What platform are you using (if any)? What works and 
> what does not?
I was just looking at similar device additions in brcmfmac, and noticed 
they didn't have much of a description, so I decided not to add much 
either. Should I add some general info about the BCM4361 into the commit 
message?

BCM4361 is used on the Samsung Galaxy S9 device (samsung-starlte), based 
on Exynos9810. There it's connected via PCIe link. Not sure if perhaps 
there's SDIO or USB or other variants of this chipset. Everything 
"basic" seems to work, seems to connect to both 2.4GHz and 5GHz 
networks, download speed looks good. Haven't tried station mode, but I'm 
not sure what's the proper way to set it up anyway.
>
>> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
>> ---
>> Changes in v2:
>> - EDITME: describe what is new in this series revision.
>> - EDITME: use bulletpoints and terse descriptions.
>
> This really does not look very useful. Those EDITME: are for you! As the
> actual patch did not change you can probably say:
>   - fix subject format indicating wifi subsystem and wireless-next repo.

Oh, sorry, I did not notice that b4 puts the changelog there if it's not 
in the cover letter. It's been a while since I last submitted something 
:) I will add the changelog there for v2 and v3 once I submit a v3.

>
>> - Link to v1: 
>> https://patch.msgid.link/20260803-broadcom-staging-v1-1-f6f77e55b72e@gmail.com
>> ---
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c       | 3 +++
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c       | 3 +++
>> drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h | 2 ++
>> 3 files changed, 8 insertions(+)
>
> [...]
>
>> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c 
>> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
>> index 55f4d7b970f2..914ae72a7b74 100644
>> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
>> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
>> @@ -59,6 +59,7 @@ BRCMF_FW_CLM_DEF(43570, "brcmfmac43570-pcie");
>> BRCMF_FW_DEF(4358, "brcmfmac4358-pcie");
>> BRCMF_FW_DEF(4359, "brcmfmac4359-pcie");
>> BRCMF_FW_DEF(4359C, "brcmfmac4359c-pcie");
>> +BRCMF_FW_CLM_DEF(4361, "brcmfmac4361-pcie");
>
> Are you sure the CLM blob is required? Can you test without it being 
> present in /lib/firmware?
I have tried without the CLM blob, it says "no clm blob available, 
device might have limited channels available" but seems to at least 
somewhat work, I haven't noticed a difference. It's still a good idea to 
load it probably, right?
>
>> BRCMF_FW_CLM_DEF(4364B2, "brcmfmac4364b2-pcie");
>> BRCMF_FW_CLM_DEF(4364B3, "brcmfmac4364b3-pcie");
>> BRCMF_FW_DEF(4365B, "brcmfmac4365b-pcie");
>
> [...]
>
>> diff --git 
>> a/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h 
>> b/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
>> index df3b67ba4db2..b800cbfdece1 100644
>> --- a/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
>> +++ b/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
>
> [...]
>
>> @@ -86,6 +87,7 @@
>> #define BRCM_PCIE_43602_2G_DEVICE_ID 0x43bb
>> #define BRCM_PCIE_43602_5G_DEVICE_ID 0x43bc
>> #define BRCM_PCIE_43602_RAW_DEVICE_ID 43602
>> +#define BRCM_PCIE_4361_DEVICE_ID 0x441f
>
> Please add:
> +#define BRCM_PCIE_4361_2G_DEVICE_ID 0x4420
> +#define BRCM_PCIE_4361_5G_DEVICE_ID 0x4421

Are those some special variants of the chipset?

>
> Regards,
> Arend
>
>> #define BRCM_PCIE_4364_DEVICE_ID 0x4464
>> #define BRCM_PCIE_4365_DEVICE_ID 0x43ca
>> #define BRCM_PCIE_4365_2G_DEVICE_ID 0x43cb 

Thanks,

- Markuss

