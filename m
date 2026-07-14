Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70104E379B
	for <brcm80211@lists.linux.dev>; Tue, 14 Jul 2026 17:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784048599; cv=none; b=JPJEA1EH2M/yJYuJnOQERifZzeJmObC7DgaiRLLJDB+WZfgpEw6F18r6idp05kRrivxR79twbvN8itAwQMLKkWd9qv8QQReLI07+ep5YdVYI9VlymP4UlRTSn2Zg0zhfcebxaWm+BNidqJj+6hRQzzc4CUr0HSYTrCeCHVnltQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784048599; c=relaxed/simple;
	bh=RrM+CrO/r8o7FGUOsnl8gZr1EiYzoxDBKu+JkNQEhU4=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=NVGi/ykhTfLiymWpvDKy6qsmaQKrzRlKIU4S34Teba44RqmGHtFKBmowP0rXOfiityoS2+6Z+WFcqQDUwzMukCmOZzO6M3nBKT6grg3IHDx4+4pNscTVmtYhLqB78+mulG7w4OKYztYYGUbbZjvHiP49P//Dov+pjrEeQ+la9x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=BOYaWC5A; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="BOYaWC5A"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso1504780a91.1
        for <brcm80211@lists.linux.dev>; Tue, 14 Jul 2026 10:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784048597; x=1784653397;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3XaKw1mZ5safaShnh8fqMEdlQ2rL6BwLt+Z3QDeOIY=;
        b=YJkHqQ/tt8Vm7pCR5LK0Z6W0qwiUahpPEa1DOlg7Tld8X5+X5UindWMqwfghPRu+z3
         jPE1njNLOPLXnT56pcbGLRWpE4U7QIX08xVBPn8el29kUN/VwUT7MxL6oc3XdXrh3K6A
         3SuKuJcLJsBIUJ+2Ffv1rF0sF4Swma7ba3K7LxV4RfVyN0zP3ioWSDHhEIDLnj4Vtqbr
         fWbiYhwQOyByWaozHEOs4Nkt8AJ3W/ZToGqIfs6pJXsZ816nokPNQKmZilqwHyEpvCEu
         MjnL4S/g6FT/XQWuOb0sC97TA3yJQFaBZ+jvrqHGZ2+jNbnaqaTX1K0osBCbk/TYZQVL
         DU0A==
X-Forwarded-Encrypted: i=1; AHgh+RphwOjxPvwSrD3UIJw5G82NSOzgTTGT7jMNnWSbUJLVEoMo7mbLEbTi/8Njo/4S9Pr031/wZW+yQFY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwceJmvKawXe6/+xTF0OzJMC29vhonRLDn5f9ZINH8q7w7eAfvF
	ICxPd8R9PvWCjEjeheX+Uph+mYBdnXNVpcWuEcWbkQH/pF8qHEgGDFpZRDDkBokar3IovGIdFL+
	d0RrNBrja0ApFwxmhUwRGWTxGOQ0gloWixoA0fgXEFhf4DyAXg0VDouRo+mXBH6G0t7lBehLSgh
	Zl3MnSMmfm+0mi7vZ0CMO4viWyzS/gF265WcvkKbCcv4vJUUqmBSZHyeqPJqJWdT4NPT0ZJVinf
	AtSY1dM6nBnB4hRZk47ew==
X-Gm-Gg: AfdE7cmlTgPzNSq8+rWILlHZDrcADwzKvfQCoNZoTl0uk3Lge2mssJUld25ur7v+YhG
	o3i7qKRCFYRjetBVKwbpWe8XoD/1ibpToJ+MA2W52XMBoLb22fSuR9M575TGVQWg1I7wTIz1DQE
	RlnUUiXKdeQ9QXBttXdtZf1oZA1sV/ZjsmWj0Njnu970zTb9+f1dMj4YEQinWTZM9W4eH25LgSa
	RuUWkAn82mq0W5u2nU7KsUuAfHFYkWcvYVooUdDoEKoaOjOJp6ORZVNpVf1Q4YH3il8nar+/fF+
	pIQb0wId8Kuk8ZN52UzZPcbtpmP1wnNgXO8IJ3JzbIflM3ZwL9Vt09HGN+SME75cNipx4hbZEfK
	rwKPwRFtuimM6H8R6E/YXzjFbLHVa/TACvSzdQKGGtVONTL7iNZDfWWgBdkWyiQLMivylx5hqXT
	g7h5LGvi3L39myteUEDTb9mKGHCnB0374gVmfMkn/CqefbXk9OSw==
X-Received: by 2002:a17:90b:3b50:b0:38d:f096:a1dc with SMTP id 98e67ed59e1d1-38df096a242mr8366153a91.11.1784048597099;
        Tue, 14 Jul 2026 10:03:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-38e172f76fasm266199a91.5.2026.07.14.10.03.16
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jul 2026 10:03:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c15d4224f9dso226088066b.3
        for <brcm80211@lists.linux.dev>; Tue, 14 Jul 2026 10:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784048594; x=1784653394; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W3XaKw1mZ5safaShnh8fqMEdlQ2rL6BwLt+Z3QDeOIY=;
        b=BOYaWC5AVu4b9sTX+Ry3+WJ6uKpxfCAqizYex33606h/BGZfYy4pJJJWyd/U1X2kCH
         vkrRGJ6FgtL018WJb77SFPwCek9gCbK0E6f4kro9LfjS9BuNXjHwcUrCLIDTBg62gWx5
         I08TcCvqtQcoBisDxu7Ae3JlIHiSPTUb9h+Es=
X-Forwarded-Encrypted: i=1; AHgh+RpLTjGsIYPeBZXnuHSor9NIq3x4hHoDKtmXSHNscVj6OzecR+x3rPWWNEM1IWvG5VLYMhovfysGcLo=@lists.linux.dev
X-Received: by 2002:a17:907:8e11:b0:c16:5b2e:f972 with SMTP id a640c23a62f3a-c165b2eff60mr300353166b.53.1784048594405;
        Tue, 14 Jul 2026 10:03:14 -0700 (PDT)
X-Received: by 2002:a17:907:8e11:b0:c16:5b2e:f972 with SMTP id a640c23a62f3a-c165b2eff60mr300349566b.53.1784048593952;
        Tue, 14 Jul 2026 10:03:13 -0700 (PDT)
Received: from [100.98.74.8] ([109.37.130.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15b7561db1sm1136622566b.12.2026.07.14.10.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 10:03:13 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: LiangCheng Wang <zaq14760@gmail.com>, Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
CC: Kalle Valo <kvalo@kernel.org>, Angus Ainslie <angus@akkea.ca>, Wig Cheng <onlywig@gmail.com>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <wlan-kernel-dev-list@infineon.com>
Date: Tue, 14 Jul 2026 19:03:13 +0200
Message-ID: <19f61952868.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20260714022859.1849447-1-zaq14760@gmail.com>
References: <20260713-b43752-f2-blksz-v1-1-8697fcfeaef4@gmail.com>
 <36f4388a-b856-438c-8ef4-795a7b1eda3e@broadcom.com>
 <20260714022859.1849447-1-zaq14760@gmail.com>
User-Agent: AquaMail/1.59.0 (build: 105900627)
Subject: Re: [PATCH] wifi: brcmfmac: set F2 blocksize to 256 for BCM43752
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 14 juli 2026 04:29:16 schreef LiangCheng Wang <zaq14760@gmail.com>:

> Hi Arend,
>
> On 13/07/2026 12:51, Arend van Spriel wrote:
>> Looks good to me but the stable instruction looks confusion. What do you
>> mean. If there is no 43752 support there is no need for this patch, right?
>
> Thank you for the review, and thanks Gokul for the detailed
> explanation - that is exactly what I meant, and sorry the annotation
> was not clearer. To summarize: 43752 support has been present since
> v5.15 (commit d2587c57ffd8 ("brcmfmac: add 43752 SDIO ids and
> initialization")), under the SDIO_DEVICE_ID_BROADCOM_CYPRESS_43752 id
> name. Commit 74e2ef72bd4b ("wifi: brcmfmac: fix 43752 SDIO FWVID
> incorrectly labelled as Cypress (CYW)"), which landed in v6.18,
> renamed it to SDIO_DEVICE_ID_BROADCOM_43752.
>
> I also have to correct myself here: the boundary in the annotation
> should have been "<= 6.17" rather than "<= 6.16", since the rename
> only landed in v6.18. Apologies for the extra confusion.
>
> Gokul's suggestion of cherry-picking the rename patch together with
> this one into the stable trees sounds cleaner to me than editing the
> id name while backporting, so I would be glad to go with that.
>
> If it helps, I would be happy to send a v2 with the stable annotation
> in the prerequisite format from
> Documentation/process/stable-kernel-rules.rst:
>
>  Cc: <stable@vger.kernel.org> # 74e2ef72bd4b: wifi: brcmfmac: fix 43752 SDIO 
>  FWVID incorrectly labelled as Cypress (CYW)
>
> Please let me know if you would prefer that, or if the patch is fine
> to take as is.

Cc: instructions to stable should stick to the stable-kernel-rules format 
if possible. I suspect there is a bit of scripting sifting through it.

Regards,
Arend

> Best regards,
> LiangCheng



