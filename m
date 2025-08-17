Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E8222F74D
	for <brcm80211@lists.linux.dev>; Sun, 17 Aug 2025 10:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755427034; cv=none; b=SWr3W7CCZCh6vC/KSEUbCZ/tkPaZ2YH+mUF5koOXocAwgebN9qPdMg9OdKi8E8tEQWDg/CpELJalostAi/iSPgH3I2bjDDyLyyh1vcufVUG5c2OPT8cn0Q1vdnt/ipNkcKHUqYH1IEPcyjIO67L0F1NVR9PltZ9mE/Gj7FXc8jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755427034; c=relaxed/simple;
	bh=iSllK/eVPmkmYdDM1igS9ECfgRrvRcauOGTshfvTr+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IqHSzqMO6m09qLfcco4Lj9EWZRfRrIBWzlVy8ef59fFoIMeCdIpE2sa5Ub+WW0zCs+OWIrvoLrykG0CX/thhLplLfGQhp8SErflwrhOVRrvkg/1EciVyCH2XnBV26NVHxqdvFSdIGWqBxz0RSRsiqNoF6IIdh45aXNVUeyDdl0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=N9uL1UU5; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="N9uL1UU5"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-70a9f6542f7so26591906d6.3
        for <brcm80211@lists.linux.dev>; Sun, 17 Aug 2025 03:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1755427031; x=1756031831; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G6sCIz2VREySyzsVRI/UsMW0BUAHcF4D9MDx7DRdElc=;
        b=N9uL1UU5UgIw01U200MV0n0p5rvlDRYvUbdrnm+7WvYnJyRxH6vjhFN59Zfjkb9eNf
         RofbstkKb3vvaDWIAtQIZeysiz9QG6/iRkzuhjYTRD9KEtxdxYcJFbxE3UZ4HgRBZDAs
         o4r1susj6BgRz1N6klahdcPLlFsI3b+R6roik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755427031; x=1756031831;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6sCIz2VREySyzsVRI/UsMW0BUAHcF4D9MDx7DRdElc=;
        b=C5xlq4SrFiBD0WD15DtkoOskpjT+EciZNngtcChRuBRW8hn1GetLGnOB9JUereLpC+
         QriOnnNJPv79+QsSDpoKSbjYNrlv2Pa90ZBl7RVfZX3wjBsBrF69meEtTeUQ4i+uyWeH
         c1TGv6UA08tDakASMSEWoOcSnzNmcVc9TZYNQIaK88pWjye4y4eoHvEXx7DEo/i0QUlm
         oehxTXJprGkR0Z+OGq/jT+2F5vlQH0YcXvPlVmhI6a5oOsvWi+br3BiQ8YXH5/v4vX+1
         u9NN441BKI2DvuvAidgP1aXyN2O2MEe9jOKD6cOTh/cg3H6CSoQAurkkc2/FE+cq883r
         +apw==
X-Forwarded-Encrypted: i=1; AJvYcCUL7+AW1i4umSzK6T4lcfhFSYjD7GOUf1/9GhSUMqab7SJmskL6fUz0IZ5UJsO4kg5ZQ153MzkARr8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8Qg1vBsX4lntcNUPn+3flMnO+S94CwgeYBk61sIyBYc0DWau1
	ua1ws0YtjJHEMOG4mi31jiYP+XiOWcxvpRwaPXMEydemYUmQSANsLIloYn8jFbCzBw==
X-Gm-Gg: ASbGnctoVLphoc89UeLn1xfUjXmVjNzNPuxm4Ob9l6rZGe5X50/HYN+QhyL/SdRcIUm
	rR4djs5cm4SbbaEZYOR6XsQLTZVeTDmzTzJxVxKX/wFE5ELQPl698nnPqoLcXFeMOhQJQjx+IUl
	7+1kCwLEYniZlnVvym9nDTgTaQplLdkxQmg9f/x0PjXQceMq096CygOONCqfBm5cmWuETYmD9FB
	dhTH8E2w9p/QamrDBkFGIrRto/6bv8T6aH0cECYFN745CZEQizgjvU3vyL6+MZKJA4l7O+Z1/po
	jCY+CEfW5w1WgWkptmBrDt+kfO6whz0gtUXmB9x7YNV+cdPU277eAhSkeh4P4paYL7zgVKZKozn
	4KV7ufjxeRgD+iMqYBV/43ztt9TsDrf9wIXetpDx06f4lFYhfRSHb8OOvTP6FzMUQus6p8Llf3W
	5yy8esqg==
X-Google-Smtp-Source: AGHT+IHx28JX4MTU+/w2vDqZ1SEYeUwX28qzixq0OdjgrBtHUJZTJMwML13kgpQ+vBUh8/Fm4t9tqQ==
X-Received: by 2002:ad4:5c4d:0:b0:6ff:1665:44ef with SMTP id 6a1803df08f44-70ba7b2648emr99050036d6.22.1755427030588;
        Sun, 17 Aug 2025 03:37:10 -0700 (PDT)
Received: from [192.168.178.137] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba9301703sm36080976d6.49.2025.08.17.03.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 03:37:10 -0700 (PDT)
Message-ID: <9fc9a2b6-621f-4d24-a726-fe4309e090ba@broadcom.com>
Date: Sun, 17 Aug 2025 12:37:04 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] brcmfmac: avoid assignment in if/else-if conditions in
 NVRAM load path
To: darshanrathod475@gmail.com
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20250812123636.2142292-1-darshanrathod475@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 xsFNBGP96SABEACfErEjSRi7TA1ttHYaUM3GuirbgqrNvQ41UJs1ag1T0TeyINqG+s6aFuO8
 evRHRnyAqTjMQoo4tkfy21XQX/OsBlgvMeNzfs6jnVwlCVrhqPkX5g5GaXJnO3c4AvXHyWik
 SOd8nOIwt9MNfGn99tkRAmmsLaMiVLzYfg+n3kNDsqgylcSahbd+gVMq+32q8QA+L1B9tAkM
 UccmSXuhilER70gFMJeM9ZQwD/WPOQ2jHpd0hDVoQsTbBxZZnr2GSjSNr7r5ilGV7a3uaRUU
 HLWPOuGUngSktUTpjwgGYZ87Edp+BpxO62h0aKMyjzWNTkt6UVnMPOwvb70hNA2v58Pt4kHh
 8ApHky6IepI6SOCcMpUEHQuoKxTMw/pzmlb4A8PY//Xu/SJF8xpkpWPVcQxNTqkjbpazOUw3
 12u4EK1lzwH7wjnhM3Fs5aNBgyg+STS1VWIwoXJ7Q2Z51odh0XecsjL8EkHbp9qHdRvZQmMu
 Ns8lBPBkzpS7y2Q6Sp7DcRvDfQQxPrE2sKxKLZVGcRYAD90r7NANryRA/i+785MSPUNSTWK3
 MGZ3Xv3fY7phISvYAklVn/tYRh88Zthf6iDuq86m5mr+qOO8s1JnCz6uxd/SSWLVOWov9Gx3
 uClOYpVsUSu3utTta3XVcKVMWG/M+dWkbdt2KES2cv4P5twxyQARAQABzS9BcmVuZCB2YW4g
 U3ByaWVsIDxhcmVuZC52YW5zcHJpZWxAYnJvYWRjb20uY29tPsLBhwQTAQgAMRYhBLX1Z69w
 T4l/vfdb0pZ6NOIYA/1RBQJj/ek9AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQlno04hgD/VGw
 8A//VEoGTamfCks+a12yFtT1d/GjDdf3i9agKMk3esn08JwjJ96x9OFFl2vFaQCSiefeXITR
 K4T/yT+n/IXntVWT3pOBfb343cAPjpaZvBMh8p32z3CuV1H0Y+753HX7gdWTEojGWaWmKkZh
 w3nGoRZQEeAcwcF3gMNwsM5Gemj7aInIhRLUeoKh/0yV85lNE1D7JkyNheQ+v91DWVj5/a9X
 7kiL18fH1iC9kvP3lq5VE54okpGqUj5KE5pmHNFBp7HZO3EXFAd3Zxm9ol5ic9tggY0oET28
 ucARi1wXLD/oCf1R9sAoWfSTnvOcJjG+kUwK7T+ZHTF8YZ4GAT3k5EwZ2Mk3+Rt62R81gzRF
 A6+zsewqdymbpwgyPDKcJ8YUHbqvspMQnPTmXNk+7p7fXReVPOYFtzzfBGSCByIkh1bB45jO
 +TM5ZbMmhsUbqA0dFT5JMHjJIaGmcw21ocgBcLsJ730fbLP/L08udgWHywPoq7Ja7lj5W0io
 ZDLz5uQ6CEER6wzD07vZwSl/NokljVexnOrwbR3wIhdr6B0Hc/0Bh7T8gpeM+QcK6EwJBG7A
 xCHLEacOuKo4jinf94YQrOEMnOmvucuQRm9CIwZrQ69Mg6rLn32pA4cK4XWQN1N3wQXnRUnb
 MTymLAoxE4MInhDVsZCtIDFxMVvBUgZiZZszN33OwU0EY/3pIgEQAN35Ii1Hn90ghm/qlvz/
 L+wFi3PTQ90V6UKPv5Q5hq+1BtLA6aj2qmdFBO9lgO9AbzHo8Eizrgtxp41GkKTgHuYChijI
 kdhTVPm+Pv44N/3uHUeFhN3wQ3sTs1ZT/0HhwXt8JvjqbhvtNmoGosZvpUCTwiyM1VBF/ICT
 ltzFmXd5z7sEuDyZcz9Q1t1Bb2cmbhp3eIgLmVA4Lc9ZS3sK1UMgSDwaR4KYBhF0OKMC1OH8
 M5jfcPHR8OLTLIM/Thw0YIUiYfj6lWwWkb82qa4IQvIEmz0LwvHkaLU1TCXbehO0pLWB9HnK
 r3nofx5oMfhu+cMa5C6g3fBB8Z43mDi2m/xM6p5c3q/EybOxBzhujeKN7smBTlkvAdwQfvuD
 jKr9lvrC2oKIjcsO+MxSGY4zRU0WKr4KD720PV2DCn54ZcOxOkOGR624d5bhDbjw1l2r+89V
 WLRLirBZn7VmWHSdfq5Xl9CyHT1uY6X9FRr3sWde9kA/C7Z2tqy0MevXAz+MtavOJb9XDUlI
 7Bm0OPe5BTIuhtLvVZiW4ivT2LJOpkokLy2K852u32Z1QlOYjsbimf77avcrLBplvms0D7j6
 OaKOq503UKfcSZo3lF70J5UtJfXy64noI4oyVNl1b+egkV2iSXifTGGzOjt50/efgm1bKNkX
 iCVOYt9sGTrVhiX1ABEBAAHCwXYEGAEIACAWIQS19WevcE+Jf733W9KWejTiGAP9UQUCY/3p
 PgIbDAAKCRCWejTiGAP9UaC/EACZvViKrMkFooyACGaukqIo/s94sGuqxj308NbZ4g5jgy/T
 +lYBzlurnFmIbJESFOEq0MBZorozDGk+/p8pfAh4S868i1HFeLivVIujkcL6unG1UYEnnJI9
 uSwUbEqgA8vwdUPEGewYkPH6AaQoh1DdYGOleQqDq1Mo62xu+bKstYHpArzT2islvLdrBtjD
 MEzYThskDgDUk/aGPgtPlU9mB7IiBnQcqbS/V5f01ZicI1esy9ywnlWdZCHy36uTUfacshpz
 LsTCSKICXRotA0p6ZiCQloW7uRH28JFDBEbIOgAcuXGojqYx5vSM6o+03W9UjKkBGYFCqjIy
 Ku843p86Ky4JBs5dAXN7msLGLhAhtiVx8ymeoLGMoYoxqIoqVNaovvH9y1ZHGqS/IYXWf+jE
 H4MX7ucv4N8RcsoMGzXyi4UbBjxgljAhTYs+c5YOkbXfkRqXQeECOuQ4prsc6/zxGJf7MlPy
 NKowQLrlMBGXT4NnRNV0+yHmusXPOPIqQCKEtbWSx9s2slQxmXukPYvLnuRJqkPkvrTgjn5d
 eSE0Dkhni4292/Nn/TnZf5mxCNWH1p3dz/vrT6EIYk2GSJgCLoTkCcqaM6+5E4IwgYOq3UYu
 AAgeEbPV1QeTVAPrntrLb0t0U5vdwG7Xl40baV9OydTv7ghjYZU349w1d5mdxg==
In-Reply-To: <20250812123636.2142292-1-darshanrathod475@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/12/2025 2:36 PM, darshanrathod475@gmail.com wrote:
> From: Darshan Rathod <darshanrathod475@gmail.com>
> 
> The NVRAM selection logic in brcmf_fw_request_nvram_done() used
> patterns like:
> 
>      if ((data = bcm47xx_nvram_get_contents(&data_len)))
>          free_bcm47xx_nvram = true;
>      else if ((data = brcmf_fw_nvram_from_efi(&data_len)))
>          kfree_nvram = true;
> 
> This style violates kernel coding style guidelines and triggers
> checkpatch.pl errors. It also slightly reduces readability.
> 
> Refactor these cases by separating the assignment and the check,
> ensuring behavior remains identical while complying with coding
> standards.

Thanks for this patch.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>
> ---
>   .../broadcom/brcm80211/brcmfmac/firmware.c         | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
