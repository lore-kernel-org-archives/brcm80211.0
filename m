Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFFA468C1B
	for <brcm80211@lists.linux.dev>; Mon, 28 Sep 2026 07:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582352; cv=none; b=ljO7Fu4o00jwRofEI38EMeL3dSM1vlI0ECYVfFAOQh207qEsntLf6y/igIckppylFC8qSmEWFJE0/N8FxkG6T7XZkCFYSw+n0ZIvBv44YukT2whceYeeIBhSaE1MDpYJpzGl1kw5fZpRDhN4OM6WRdbAjrudopRVqUi8mTHacTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582352; c=relaxed/simple;
	bh=ED+sBRr3QhMO5/4gS/VqfY8k9EZbHBPa7Fm+KPqc9as=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lWfFeOUVBJdes090YppqRTR6PnqTNRIqiMz7shtXbwedNsWx8vBdUY9dMSy14f4tUyVsckbS4jKQxE8oBVi5m50ZUayBa+JStMHwxFvk1CFpwvXyiIrVPET4XPHw3sAdWyU7SQxrzMg4pEmKDFktdQUoHg9x/C5ENGIbvchruGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=G8tC+kAP; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="G8tC+kAP"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-49ff96a9784so6369525e9.1
        for <brcm80211@lists.linux.dev>; Mon, 28 Sep 2026 00:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790582349; x=1791187149; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhysCFeCFrK6Hy/AV9kl1/zr3IXUOwo2mfXgBsYx8sE=;
        b=G8tC+kAPTJs4jh3B9APS4k8Vyif9m+WO1phnmarza0QlOV/ZjAZIBG288WrX98+eJ3
         Ot80zyYDPYYbCahQ04A5VttDxgg8GvP+onmGb4AyiJ9BZkjeDDD0LrefJAOVnXxHlQLL
         HhczcqaE1t7oV1s8DfrQ3ledjZjXZ6l8iZxgNQpGqe8+7PO4OvSMcajqH7ekcetSho7K
         v7AK7bx0rxH55/STvw0IDsBFgTq0Kkq5FT5hlhQv9cCdR/Fv2EZkL9Zw9M856UWoMoVI
         +lQRE/7HKTM592AqhzrQ7FZxSfCJpMPwzeBDpZt3qbBCdBi0gwQFJqNCkhnI++fidXYH
         kuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582349; x=1791187149;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhysCFeCFrK6Hy/AV9kl1/zr3IXUOwo2mfXgBsYx8sE=;
        b=EPkJNAGQH9YQMPNPgsIi94DpXgaVvT1UY6IQwJ/r5PviWb60Ysm21OV9jFev6z6tTS
         piNg5vfqs2sqezTS63c5Ugw5vVlJjehmcKKd47Tr84EozvKLU1uHHS1G1BxkCymZATrT
         xNQKc21QZDKP+kJWnCxTiCAUicQ7qKX/CJzDO2vdMUwISfFprg8pTYfqjlVqQMQFyK17
         eaaR81B3Wtdg/WVHG/Cb8B+WB772+SzvcbdqUrT2MSIdx0eDuYY1TQ4CUbVf8PyBGspI
         /Y94NKH9J20clkhVwllqEPCXi7WQFh9cBPVqjbtO583SEipUEZ1YtOK/7hDu4bEdMEBO
         qOvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoLGFX6Cyty2JHMhE/8vQvG9+YAfmTZ6D1CL2dsHRcNxnAt5L9IG8ps48HRfN/BtPETDYFoCDji+Y=@lists.linux.dev
X-Gm-Message-State: AFuF++nsuVwKGIuGwPL4LQYa5yHVdQys2wlIc7U9BMNv/ChwqS0HSP1o
	sI7dzo5AQ8aanl0kEe74RcwLMBZ69F90GCs5Ysas5jKWAULvOEmFln8hys4o0X7yiBg=
X-Gm-Gg: AYBFou1XEp6Tye8dJZPjzOmUKNh4hBcOf+gOUiifLAv7HIyYN0dn+aGKElRkBpX+gWn
	4zsjBWJ9h0C8ul3S+gWqfWqmOSvsBxAqGSRAUwSagejl4bHQbMs+oxX/m5FW+zSAnVLB9AEzzV+
	w2GNXicTdgQhWU+FkBL0sfj7XSkeWIUTVahv9ng/p5irNrqthJa3BO1i/z/k5J2lCd9RiiS8850
	vMyoVIWi74Ewok7CvDsKwK+dzoVnqexilIdhx4j49813TvtCiYlFUFlfgUw7w+9znrRg5q0vBRj
	b5fdHkcO0p/IMjlRzKcRKyR+KbYBSjn0M5SZqSQl7Li+vFE6Roaw6VkgC8OGPM5qAW+6PKiuJfc
	hB6Bd+IFJt9L0HKtl/kynHT5kMtwnMvFY/OU98mOJ2Dqs3v+2qWc7R5Mah0A9LBkp9bpk66jFov
	JuyF12wOPMIR8ljDmz1vNoHj+ynBlq7l7dcC/+F1wwxGgIThrcWV6Yn0wUFG0TcapTNrQe0DVk8
	YnqQA8RpHWc4mFfvfYWLdLWQsq0C+g37oem9ev5hGTs/NK1XmD2uA==
X-Received: by 2002:a05:600c:a4c:b0:49c:fa20:cc08 with SMTP id 5b1f17b1804b1-49fe67060cemr213903135e9.31.1790582349255;
        Mon, 28 Sep 2026 00:59:09 -0700 (PDT)
Received: from [192.168.0.38] (static-246-51-231-77.ipcom.comunitel.net. [77.231.51.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a007be0761sm21702035e9.3.2026.09.28.00.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 00:59:08 -0700 (PDT)
Message-ID: <bafa7204-1025-4db6-974b-1491d3cc48a6@suse.com>
Date: Mon, 28 Sep 2026 09:59:07 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: brcmfmac: Add clm_blob firmware for
 brcmfmac43456-sdio
To: Benjamin Drung <benjamin.drung@canonical.com>,
 Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20260923203739.2560527-1-benjamin.drung@canonical.com>
 <20260923203739.2560527-3-benjamin.drung@canonical.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20260923203739.2560527-3-benjamin.drung@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/09/2026 22:37, Benjamin Drung wrote:
> On Ubuntu 26.10 these firmware file are missing inside the initrd when
> including the brcmfmac kernel module:
> 
> ```
> /usr/lib/firmware/brcm/brcmfmac43436-sdio.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43456-sdio.clm_blob.zst
> ```
> 
> So include the clm_blob firmware file for brcmfmac43456-sdio similar to
> the other firmware files.
> 
> Bug-Ubuntu: https://launchpad.net/bugs/2168109
> Signed-off-by: Benjamin Drung <benjamin.drung@canonical.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> index 3cff0f1fe25f..cea52d408817 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> @@ -618,7 +618,7 @@ BRCMF_FW_CLM_DEF(43430A1, "brcmfmac43430-sdio");
>   BRCMF_FW_DEF(43430B0, "brcmfmac43430b0-sdio");
>   BRCMF_FW_CLM_DEF(43439, "brcmfmac43439-sdio");
>   BRCMF_FW_CLM_DEF(43455, "brcmfmac43455-sdio");
> -BRCMF_FW_DEF(43456, "brcmfmac43456-sdio");
> +BRCMF_FW_CLM_DEF(43456, "brcmfmac43456-sdio");
>   BRCMF_FW_CLM_DEF(4354, "brcmfmac4354-sdio");
>   BRCMF_FW_CLM_DEF(4356, "brcmfmac4356-sdio");
>   BRCMF_FW_DEF(4359, "brcmfmac4359-sdio");

