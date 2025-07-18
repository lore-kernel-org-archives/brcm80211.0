Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A709299A96
	for <brcm80211@lists.linux.dev>; Fri, 18 Jul 2025 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752834418; cv=none; b=PK/sAxYRzhdPRrFTO77eqYlMF6RW3ey7K/0qB1Rh7P6omWkZynos/AzjAfewOosNRnSKndCNreRzFDU+FV7LGcrIR2Pm/KjkDiTVMu1wQ0LqV0sYMep9CU1YA3l+iayiHLxmD8q2E+3HLVzAaSgrd2H+Khzp8Gv7zyi1XV3POak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752834418; c=relaxed/simple;
	bh=iOuJFTTwJt339tYjnwcMIWFz/RUheBu5DfdHuCk8cH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFzD/ywh0dXL1L8/ymBuGN5NQZzhJDK8MlCA3IJmd2uqtgG6XHM84bZm9g/5lNl1QBfShIuzvXV8gtMF03caa/c4iJCw9YglH1JTEAOpH5NATu1ILzHRcklOaMAk7PkTEsGk1avK2CaPE4X8g14QCEzANt+hfSidc323H5oRuyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Iv7+YS35; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Iv7+YS35"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7e29616cc4fso190046985a.0
        for <brcm80211@lists.linux.dev>; Fri, 18 Jul 2025 03:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1752834415; x=1753439215; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tceb6O3nBrebvy+ZDwLDwrGTRdGaZ8naYMQfV4XKrrU=;
        b=Iv7+YS35tlNX8IMUiVQiITJtAxB+VsRpg/AScCOXe3RbNdtXdt9O0n30inS3hWj0u5
         EKjAOnluPDtN0glJSc880geqDO62uEtcoL42meXwJxL0T1rP7WQPRCM0hcKJWvbMEnSL
         dTbxVyAqNLi7tr7cCXx5EV2wDcuGPAIvf/29M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752834415; x=1753439215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tceb6O3nBrebvy+ZDwLDwrGTRdGaZ8naYMQfV4XKrrU=;
        b=CosBRfJAj33Q/pK2HccmDOy3zQUB2rGjPWaAqGjAt4iAl6i0lKr4cujc9DYbWvfwFo
         9PbWA4yTUH4IJJ1a8rtqE7Buaqi/LbXGU8Z9oFAIkCBVsr0Lf9PpdDAQbJFtfOGIe7jW
         QiZlicgI7nvcal4gUQwVNOXNl7S7Q9lhFQfIVsydt64lxZ3WvysNvmdU8PT79RaU70W6
         90DtOIvXvbBnTd5LZSnCw7JcSiBZPmRumKb5N6MLSkvk3OJDi5cACfGwrT+BOi8w+5EK
         E4BcVHKwNqfWcm0MuAYU5dOwhusDJ+J1AdOM4zaF/MMmFCtr+zmLLnj6t8EA4nzDLbnZ
         ZJZA==
X-Forwarded-Encrypted: i=1; AJvYcCVL9SWCjegxwPDr6yf6l7aMvoTX/UnuMtLb1nB1IUkoTmCTl6vdSOyz+9tipkd/2F1L7VVOFn4KbUU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBLNDM6F8W6AA6tMgtTKBANUvEneg3z7968bEpJ0l8eoiAgFrB
	xgafh4x/lJbGQeSe+SOI6w3qZUyNzsw4tPsZR/nqQjtWsHLbAQh9uncgI5/AlDknDQ==
X-Gm-Gg: ASbGncty6k5/Y5qgiC+jtbhh9HBG8DlmEqJcQGn0lBmL9m77saVNUwaYp3m5tahrcjg
	U40Gy/4AerdRAMyJTfMEuvuPMBZ3NSYu7WFpzn+y9CpuKzz7W4jvZxotSDKiDuVU0SPR8OmSKJL
	thAbN6a3BfQPRTrht9ZtBhOYyVd1dYWuDGg9tAhOk1jNllF5xMiZPsBv/CJQItelzVSQ1zVnP6F
	k3vkWPLpii1QBZ3wP/YjtlYOW+BtGkUQh7Ifmnl4oTDVjmZsa5itikYeU8iUwdmp8LglNRttQNp
	YyD7DzFYAm1UsdrMnynbj0/1IPJgLJkcxBvNBu15jgl6GeiE0z5h1Mj/ovAbAwuRmbCra2JJzv1
	1fXIbi8zEVoF/xLTExfnmJBbWrg7AlUdkx9kEb/MREgxA5MFTbWI=
X-Google-Smtp-Source: AGHT+IEqo4UAFanleVPdYl4dXVyU1lZnXf1z6whg+8xWt/p2QDWx5PJ8H+d/5db0hyJyi9WF5q8VPA==
X-Received: by 2002:a05:620a:19a5:b0:7e3:52f6:66e5 with SMTP id af79cd13be357-7e352f6672amr568859885a.35.1752834415217;
        Fri, 18 Jul 2025 03:26:55 -0700 (PDT)
Received: from [10.229.41.1] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e356b46814sm68537885a.30.2025.07.18.03.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 03:26:54 -0700 (PDT)
Message-ID: <4445c7ec-a580-4c28-89cf-2df5790de6ac@broadcom.com>
Date: Fri, 18 Jul 2025 12:26:43 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] wifi: brcmfmac: Fix typo "notifer"
To: WangYuli <wangyuli@uniontech.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org, alison.schofield@intel.com,
 andrew+netdev@lunn.ch, andriy.shevchenko@linux.intel.com, bp@alien8.de,
 brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 colin.i.king@gmail.com, cvam0000@gmail.com, dan.j.williams@intel.com,
 dave.hansen@linux.intel.com, dave.jiang@intel.com, dave@stgolabs.net,
 davem@davemloft.net, dri-devel@lists.freedesktop.org, edumazet@google.com,
 gregkh@linuxfoundation.org, guanwentao@uniontech.com, hpa@zytor.com,
 ilpo.jarvinen@linux.intel.com, intel-xe@lists.freedesktop.org,
 ira.weiny@intel.com, j@jannau.net, jeff.johnson@oss.qualcomm.com,
 jgross@suse.com, jirislaby@kernel.org, johannes.berg@intel.com,
 jonathan.cameron@huawei.com, kuba@kernel.org, kvalo@kernel.org,
 kvm@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux@treblig.org, lucas.demarchi@intel.com,
 marcin.s.wojtas@gmail.com, ming.li@zohomail.com, mingo@kernel.org,
 mingo@redhat.com, netdev@vger.kernel.org, niecheng1@uniontech.com,
 oleksandr_tyshchenko@epam.com, pabeni@redhat.com, pbonzini@redhat.com,
 quic_ramess@quicinc.com, ragazenta@gmail.com, rodrigo.vivi@intel.com,
 seanjc@google.com, shenlichuan@vivo.com, simona@ffwll.ch,
 sstabellini@kernel.org, tglx@linutronix.de,
 thomas.hellstrom@linux.intel.com, vishal.l.verma@intel.com, x86@kernel.org,
 xen-devel@lists.xenproject.org, yujiaoliang@vivo.com, zhanjun@uniontech.com
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
 <F92035B0A9123150+20250715134407.540483-5-wangyuli@uniontech.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <F92035B0A9123150+20250715134407.540483-5-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/2025 3:44 PM, WangYuli wrote:
> There is a spelling mistake of 'notifer' in the comment which
> should be 'notifier'.
> 
> Link:https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1- 
> wangyuli@uniontech.com/

I think it has been said on other patches but it is not common to link 
to obsolete version of the patch series. Apart from that:

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>> 
Signed-off-by: WangYuli<wangyuli@uniontech.com>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

