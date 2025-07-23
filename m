Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0EC28D8FF
	for <brcm80211@lists.linux.dev>; Wed, 23 Jul 2025 11:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753269238; cv=none; b=bgBMPlHWL381LSHv18Eg/I8cUO1BtmtcOY0p3YMDdy4MbcEHAVArxU2b2q967g5iBDFmhWP27P5d3242uN26F58uSJN8P5h2LBFEEj6PxwNrgKjXNNikyTmeyyInh6055/xINSUHc13hkanRmNhnmC/b2uXK0cqfjJQ8WuBPuCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753269238; c=relaxed/simple;
	bh=Rl5FDHcKst3rDIallQV9+lArjzP33DezoICoPNEKjPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVJc/1EGW+JgrjJ88qpIlPC48v1HL3u+5ohmBVpolhBZ1EJVpWnRNOV6qv623jo4O7/mQgaezFP/wwQMxq6sXNMCWKTqr8J696UScG1fLIrJQiKD/2d5zq2WdwlD4kXDjKotPqwuiSam5p1t0n2N7Va19GejymVPLvvuc3pGXhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Aiia8gqU; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Aiia8gqU"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7e050bd078cso594642385a.3
        for <brcm80211@lists.linux.dev>; Wed, 23 Jul 2025 04:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1753269235; x=1753874035; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZsZ4ceIkCMjYpv3G+hfUSNyJppKuLhKWJpjluhzw0E=;
        b=Aiia8gqUlfNfmSiKJPG5CZGCcCy1dmsyK+MrJI+X7A0bRvj4LtFFtPlZiMrAKIZlIO
         saGjd4YfL56tHxFX9cNKnVtybmD2Ka2LWWg+G5cpZrRbIbX9AjWqKLd1aXx/dOYSXO9y
         p2NxOQZT5qG5k8mfh7uGqziQe/F5Jpecb0JDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753269235; x=1753874035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZsZ4ceIkCMjYpv3G+hfUSNyJppKuLhKWJpjluhzw0E=;
        b=nWaBBluRY/tR0Nq4gRUw6l13HGCCLus4elsM8gvTVO/G6iKO9LibZ9DM0PBimZ4oes
         WdJlL30+N2x0Y0Ujw/m1nQe1HxpomMUxXx0gJzl/dsc4P9/EC8VZK0IErElnq5sXeBlt
         i0+Kd2zQuejCnbyszgdGHfImt0nTcWgQaw2SYqQEzzfYCPg0zQhWZNKEgQ9QcEuy9CNb
         SsghtlS65889kosbUbVm0bU0TlNP2gtCpavYONoUuaD5GpnKs6NxP3WT4P1LI0TNatGg
         XgrQCzV8GRmBELvzK+2FCr3eina/kVI2hK4/HLcnDuGo7St37SM3qFmHQ5Z7S4A8t5gd
         cq9Q==
X-Gm-Message-State: AOJu0Yzt4geJlgi5Z+k/9F7OahKslhKZH753F4KhXiHYEaLUaKLWjagU
	7WYRFh/WWjWxgnhZE1vGYS+4gXdDv8wM/6d+wXDyuqS9/ia/WjwDdlhOPBCkoWAKlw==
X-Gm-Gg: ASbGncsnc8aOjp2Lh0Q5+W4Ml0Y6k6KDW6sqhABe1I0OYZewKt9uJg2US5Ci+FQmoMw
	K1uAqrswxrlsAJ6LGqPkBOrWM6b/fMsiq683btZgQEp+ZKMU+ihnPNTvNq2APUvFs9oC67rgcHo
	mBfNWj9vnFW05/Inrc+SICblr+pBFyCCYmDrjhEo5elWXGuEFZSYk2OltmcQnJ3lNFV+Bh05gmt
	hakpEK6cbtaBuF79gUPYXpUDCtvuhvdKU3NUw2ZGS8U6flmYj1Ey7GTX6TLR1FRJRb4kDTFtUQ1
	fxCXT81YCM5P7poVsL8Ye8XXw5eWo1KZC1yekYOd6CWgIGLtHTHLQ/93LrzfbW5EV/M5bPQHXMK
	//5zTRkPOkHnRZvyFH5qpmtsScKMAfFU5ZXHg6CqDoZMbW7cNLeFkp4hQEXS/wbs=
X-Google-Smtp-Source: AGHT+IH4t7/7bepWnmdaXVZK8YVZIBdABuEFNlaTKLC/CcssAnhPsmY0/sDAGGy3Vv1/VtD+rGPoFQ==
X-Received: by 2002:a05:620a:458f:b0:7e3:300d:f1a with SMTP id af79cd13be357-7e62a0fde65mr324852485a.19.1753269234673;
        Wed, 23 Jul 2025 04:13:54 -0700 (PDT)
Received: from [10.176.2.145] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e356c9155csm630107985a.95.2025.07.23.04.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 04:13:54 -0700 (PDT)
Message-ID: <90b48f29-59cb-489e-95df-e3ad36812185@broadcom.com>
Date: Wed, 23 Jul 2025 13:13:51 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: brcm80211: Remove yet more unused functions
To: linux@treblig.org, kvalo@kernel.org, linux-wireless@vger.kernel.org
Cc: brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel@vger.kernel.org
References: <20250626140812.56700-1-linux@treblig.org>
 <20250626140812.56700-4-linux@treblig.org>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20250626140812.56700-4-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/2025 4:08 PM, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> This is a subset of unused functions in bcrmsmac phy_cmn.c,
> They're unused since the original 2010
> commit a9533e7ea3c4 ("Staging: Add initial release of brcm80211 - Broadcom
> 802.11n wireless LAN driver.")
> 
> Remove them.

Tested on BCM4313 card.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>> 
Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>   .../broadcom/brcm80211/brcmsmac/phy/phy_cmn.c | 129 ------------------
>   .../broadcom/brcm80211/brcmsmac/phy/phy_hal.h |   4 -
>   .../broadcom/brcm80211/brcmsmac/phy/phy_int.h |   3 -
>   3 files changed, 136 deletions(-)
