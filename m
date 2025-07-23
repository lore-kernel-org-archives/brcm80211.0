Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF3428935E
	for <brcm80211@lists.linux.dev>; Wed, 23 Jul 2025 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753265845; cv=none; b=OE+1HOsxaDHbF5RboqScKok/GteYFrZTFoVWszknXqcNzRI0iTAhZSpPAAYW/nal7s0imDmD2y66fAbOtLMz23rSfg2exV9xJk8DE595mpkeXhYLAQuoTkmG6fF/4gGWmsH1inoWcXjN4b9oYFdzleMgYUHCwq/agE+HShlHb9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753265845; c=relaxed/simple;
	bh=0FWkjxUMoHwv3AQfgH23fqkY7ym36SwwU2RaJykt4jA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ch/NG5JQuILjwnJkSnYnUeoKAmEzdXGHUhEG1cQ6WtmHEd7g+ydrxn0ILzOY491OPKgOVW8j+xNTWamsCPuMk1JlmsSb/Y+aeGnpoOMd4IG6G3Wv+Xu869OZpGan+wbIrxEgkEfzsfIpMd26sG+VySu3KIxIDdIPZsnz1xoRPTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=CbgUnZaL; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CbgUnZaL"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4ab53fce526so91542591cf.2
        for <brcm80211@lists.linux.dev>; Wed, 23 Jul 2025 03:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1753265843; x=1753870643; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LJfe0U+u3u72GvAm5az+oPpJij7n1bwHFfIVuB9iyks=;
        b=CbgUnZaLrrxzNDvWAwJ0hPVelXgL+a8nOSTe3Hp+EQx3NPdSAI+9SPnvYtLS+LGm4B
         rOk4qeMzknpY37PzGAAzisJZQA7VuE88XNPKUu+sFLAoywbb0Mt1k/S1AjNrluRa6uXa
         Vrrg4GnQzfLnMdqolaovwebqgUhnzmyXMCny8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753265843; x=1753870643;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJfe0U+u3u72GvAm5az+oPpJij7n1bwHFfIVuB9iyks=;
        b=af3GBxfLemCLrni008cFzPci2tZsScRhD3CpcLCPeAO5Ju5ClfONJny/1BYz5/Au+C
         66vR2MPSAwaVl12nZBCvvNPzXIIAi8jLaQwjKKPIjxXKz7FdJzGilQubkI05xYlUJUBe
         2vxTVto1gL4OMJbXnFlEa1SsXQtkHuPFS7v2Jb/+bCzE9K2Ertjp47eFHU3NAmiv+REK
         u14tqs0dv0Snnh0EDB/8iR7shvVJfnrfgXRyI+dOYMyW7cEqs6fH01rwXXpxUofcFxR2
         V5j6HUWoAFxJOGdUun+29jnB1wdON69hGlC8Gk/MRq1U/2pigba4VurvCQQcV59lAuQD
         N2Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUoBvb8ttvRfytSYkiRPdpKXswm4hslCjyj+NE+xWfMHYI4HtER/lUyyDLxWYqYjLKWV5kG4HDu0GI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl1NUc04763/MImM4+zt8Fggb8OYV9lC8nJieA8Nh8CuDa5UzV
	doB7U9wMC9LhUT+90UO3s+nhgIAZXSAVw9GUHhltagNHNidXwb4dJ5WbDMKEUATUgw==
X-Gm-Gg: ASbGnctyA8FNSWGb17i+M6yIK+LzCTaOFrjcPovUUA/2wkBxExVN+WQhHuzeis5PdeV
	NbckZ0UGJP6blWrKkQWvf5TEWy98GvYfGGI70TE/f3mUyqSFwrIqA9Jlt7w9WPAZJHjTltWkiBT
	GnyQukDIx3mbQBtkPnNVPEueSJqVsQA7nlfsDmqH325MXCplYeOBGERrYYJLSDG4v2HeOw3ERig
	JDSR1hGs5xXlJIge+VJ6rhBgUYWuaYBogxS4KPdWMxSE0MOdso7goz7yZlcs9SxTaYA4UtmpHaM
	b8qlSQ+aVNGKm3R/FygGdNGYlzhckFOadaY6NAjkZ/Lq3PuwXr+0v9bZHIJACRj0WXymRbpWw78
	gvJ8ZfmUTHiYjcjTq4rkp23v3j1tAHOMCy1vKpnfawZCDIei9Yroh
X-Google-Smtp-Source: AGHT+IGPC76h0wm+3k9n1XTW4Rb7SXd7kFL770EuSfku4pFTU6QqODky5+n4jn+mNVWWzLJ2wjdbZQ==
X-Received: by 2002:ac8:5a41:0:b0:4ab:cf30:187d with SMTP id d75a77b69052e-4ae6de8696bmr37910481cf.19.1753265842520;
        Wed, 23 Jul 2025 03:17:22 -0700 (PDT)
Received: from [10.176.2.145] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb4b3106bsm65670351cf.60.2025.07.23.03.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 03:17:22 -0700 (PDT)
Message-ID: <af4d556e-d917-498b-80a9-ee18e51a72fa@broadcom.com>
Date: Wed, 23 Jul 2025 12:17:19 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmsmac: Use str_true_false() helper
To: liu.xuemei1@zte.com.cn
Cc: liu.song13@zte.com.cn, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com
References: <20250723173004776P6QSjcW7NrlpGYLTFM-yP@zte.com.cn>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20250723173004776P6QSjcW7NrlpGYLTFM-yP@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/2025 11:30 AM, liu.xuemei1@zte.com.cn wrote:
> From: Liu Song <liu.song13@zte.com.cn>
> 
> Remove hard-coded strings by using the str_true_false() helper function.

Fine by me. It makes me wonder though what the motivation is to have 
these helper functions. Does it reduce the amount of string literals in 
the kernel or is it purely cosmetic? Anyway ...

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>> 
Signed-off-by: Liu Song <liu.song13@zte.com.cn>
> ---
>   .../broadcom/brcm80211/brcmsmac/mac80211_if.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
