Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78B626AA93
	for <brcm80211@lists.linux.dev>; Thu, 24 Jul 2025 10:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753354423; cv=none; b=hymcwKvQqNWN1VNN9L+qcR8IH7MQGG8XEOzUkPJV6NZcQQpS9zUEZU4mmJ1cd+pphi695VmZXJInVwXxHBTJ2ulGtFPVgoMHenLTXpr6sE7eRbId1H2fkqoQAA+cdw/tg7taSLI1VSIctoUPUxthMujhaFcAtZKJt7MHlzBNSzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753354423; c=relaxed/simple;
	bh=8jDhktb6gvguDf/b1lnlB4d22HgDluIX7IIiw6J/zv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=huO8vlzT5bR9clJXE3H489svJV8SfGJomnSH57YLiAOxkIknLXw1PoUIQ9HC9xv29qPmt5FwVm16p5o3eT3JFw2SBzdRLYPb9E3PSfE9wWA9MJLnU7+VNaoisBxBu2TH4bVdcTK7rDd0PtM9eO2XsI2l+xlKR8lvoVXP6/Kl4XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PUkK92eA; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PUkK92eA"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7de159778d4so77653985a.1
        for <brcm80211@lists.linux.dev>; Thu, 24 Jul 2025 03:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1753354420; x=1753959220; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MLDOPqxlBD8FDczYchESr/JqbEeFFZ2U1GuHWKOvpoE=;
        b=PUkK92eAuoyx4GHU2JyOGLsY7l4yz5xR8SxC6gmcpaTLWtCoaa1bCPZtDXr0ezx4e7
         bWvKuLhPSTam/FWkSg6gDsjMCiSs6ke58DqRprtakgs34GP43Hafs+WCNm9nhG6pRmQw
         eVHAI9I8koPwP04bz3W7gNCryi7STB5WmJlbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753354420; x=1753959220;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLDOPqxlBD8FDczYchESr/JqbEeFFZ2U1GuHWKOvpoE=;
        b=vr2yeMqH2qt+RpkV74ECdtoQSNDEmgBDSYLeco8g2bXKSnMgw17bM5AU/LkDyQ14qs
         QFR5GWLuYNucysMXm9/zBP6hPIwBI36DARf9RLR724DL8ZgC/WkqQfnqMBi+ReQesNT8
         Z1oUcezWObVACj+JlNfVXNoJLhV4viodtEm6IFTMXgvnuLDn7WeQp8IfcubiUA0NbICx
         dlG5k61AXiFNtGQsMtiQk2lqEdKpfasuYAJ1hfQ4Lt0Q1awEerIyP9C1v5dfSxScA/Zj
         dB8tL2QRnY5wkK/MWfMVoime3eSC0ybjcc0iuLKE4eYrxSS1CJL9Kfm1WNkn+/NVjWjy
         pvWw==
X-Forwarded-Encrypted: i=1; AJvYcCVNfZCyV0IJnKXGYFEAN5ARP3GRzuD/B+o7KUK6j/13MJkTWOzAQgmeAQefHEyoZ/zKjh/ujUImd1U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxP+f1zTsFmfmN6qjsCA3zmKL5f6Dg+9LDj23TxUDItTIVj2BW4
	sHXpEdxD2d+ISS5zU5pmmnDvslTvH71GnOSS8JlT/fx5sprkYqpuIveUQk+V4VrrlJ+eIeURxp2
	3Y7Qx5dum
X-Gm-Gg: ASbGncuWCvI/mElM1JiFs8IxKycAJ87/xCaDiWWE7KWF90LiJ6DidNfw3uDOBLeitXj
	3yLfn8x0obzA6sLdcqDdG0+A5my1IN3IHCVl8BNOcjxKr1la1rQjenhRYHjz/x53C0WTTD5UPBj
	zXQW6elZeS5N/0v6JmHe2KXluwgIhWfdu7xPTDekGkiygXgZeloP/e3q7g63H6RyBaif7xlb7qE
	xbxMyM963A7vj9pgXf8HtwgPe5dQeH5MYAeF7J08R0vBShBRycjMGDpYDWo5vTLN77o+HT0cRVm
	Iyb7qhMJNhP0bO9Dn7F4B9vr7FuscVEFdVK6z7Bdjl49xejBj3Uu8YTaW9dTqmo7K1fSh+ex/PR
	zsNrIlCbRhQmpz09Zr6nT8ToPrJt368Eyqv+XMVoJ8GtJfADjeJnmGG7s1JZZsQ==
X-Google-Smtp-Source: AGHT+IGUM8uRgCOTQBFV32F5z0OirCE60eT/KIEgETJ/ZilFjesKiL9h2WFc71njrAkiKrIkgnincg==
X-Received: by 2002:a05:620a:8e10:b0:7e1:7ff7:105e with SMTP id af79cd13be357-7e62a17fd11mr426277985a.39.1753354420530;
        Thu, 24 Jul 2025 03:53:40 -0700 (PDT)
Received: from [10.176.3.57] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e632e1b89fsm99848985a.47.2025.07.24.03.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 03:53:40 -0700 (PDT)
Message-ID: <7f913cec-a867-4b9c-84cf-e890a8a12d35@broadcom.com>
Date: Thu, 24 Jul 2025 12:53:37 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v3] wifi: brcmfmac: fix 43752 SDIO FWVID
 incorrectly labelled as Cypress (CYW)
To: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 wlan-kernel-dev-list@infineon.com
References: <20250724101136.6691-1-gokulkumar.sivakumar@infineon.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20250724101136.6691-1-gokulkumar.sivakumar@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/2025 12:11 PM, Gokul Sivakumar wrote:
> Cypress(Infineon) is not the vendor for this 43752 SDIO WLAN chip, and so
> has not officially released any firmware binary for it. It is incorrect to
> maintain this WLAN chip with firmware vendor ID as "CYW". So relabel the
> chip's firmware Vendor ID as "WCC" as suggested by the maintainer.
> 
> Fixes: d2587c57ffd8 ("brcmfmac: add 43752 SDIO ids and initialization")
> Fixes: f74f1ec22dc2 ("wifi: brcmfmac: add support for Cypress firmware api")

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
> ---
> 
> v3:
>   * Rephrased the subject to indicate that the incorrect firmware Vendor ID
>     (FWVID) of 43752 SDIO is fixed by this patch.
> 
> v2:
>   * Relabelled the 43752-SDIO chip from CYW to WCC instead of dropping the
>     support for this chip as suggested by Arend.
> 
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 2 +-
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c   | 4 ++--
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c   | 8 ++++----
>   .../net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h | 1 -
>   include/linux/mmc/sdio_ids.h                              | 2 +-
>   5 files changed, 8 insertions(+), 9 deletions(-)
