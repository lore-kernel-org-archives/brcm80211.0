Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB97B34028F
	for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 19:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774726377; cv=none; b=Brk1zHC+BwIXdD8ZMIw2vhf/mcG7Rz4sLAXA0VafmGx4GylK3yfwuL8NKY2yn92ROpXejDwgddKCW6EL4LCXWQUoVuw7O6dcZ9v4n6zXAzAPPR19aJJYlrjwO72+dp2NOIq3+SlXocO/MoWl+Fxm+zg3O++ePgzbWsJYpwWAv/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774726377; c=relaxed/simple;
	bh=YUf6rSb052BdvGEYf6wJOK6wUd7BqPk40wYKuw6wD8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M0jAVKuOViHleR5f/dtY6SoItSKXf7oLIp2eFp2b2i9h69l13IBP3b6ZYeogqyth9KHwoD2iMz0Jm4QvefZqK/wpH2+yZXhBw0pgyK3KpZoJiUtwnUtwpSKznR3yVwli6SfFNQ9npaLQlyuGROXgddvaR18ET5l3WGlHulybDN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=E9fLWGUx; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="E9fLWGUx"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2aae146b604so19379605ad.3
        for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 12:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774726373; x=1775331173;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hbJ9V04+ZWZ+5XnMMOCYY9ggTWoNFS1ISmhMxK+ydVw=;
        b=nEMgIsKMehzCbwFlcEMeNAQZhkwEjWVs3hgpFACgBW2GUv0s0OG7gnjdaPIMx7vn8q
         3ezAFpNGE58Db+hAvhseWq/QHOToTeaCKFsPNGPUyhx+oddwHjMIBpFp5wwEW7CjUxrm
         ZRT+HTjFShAmBA06x/EDiH3k77C6vlnRmVDu4vPaPAdCvfCqbzyzr/NpAq8MZZIa0WDy
         /y1q7pDP59ZRXfnZXwyx+cOlmSmK63K6qUpSdhPEXks/pKqNWNT3PeTvsow7wLNQQTYI
         jNA/sIm6nJpS528S1JEdy9ogIIkABiFh4GBBdK37O5JqvNrGnh9V7hSKW5jNoOxPuaHH
         EevQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXjUkZOiHJi3NHeyE9p/aosEwuTGFHL/LqgHga+1npAHV3nRkAjuQBiEwUl+87GolNPsNGGpmPHVY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVwBog2sHMBA2Pb6ch1Vjgn4rI/MRM+rQBga2RDIQTei9/QB0N
	i1sPVnW5yqzdPMQJmAOrMrNEhRfNb6tgLb0bMk3f0ZxZH+bSL5dbjCL21C+siPONILxq9lQgLvL
	3eaWFU/+JMkLNZ5ZbTLAQZl5/42yTFoSyjeYhdvbDhjfa2A3dkjjYIZr+6cTL6HWlnR5wZO4v9I
	LqUFTyytEZiebnRjmXrm1sCMuE7PbwjD0blCn1p4m3ka6JVBSPOxA0VlJOEdGl36DfawOW13Z6e
	2EvUdXB5sj1OUdsrh74BA==
X-Gm-Gg: ATEYQzzbFteA8lLMiP8u+lnDQDiv3gQAUBQtaTx3jQP+L7r6eSW2NhVr6+pB40dZC8T
	TgC81BCNLqeGHdhjVyczwvZ86q9ngNoVI6KokNbzsX8f/pNfQKSquefwjmRf0xtq65km7Q29ieG
	A2a5Rwqg5UISd67xfdof2lOwPX3aGKTrzrWtHbY23Hk1kVJ4eBShjNRXlFXpJXoCff/MW4iGkjl
	e6WUFf7fKcDpdVM1qFA87b2AknhziNkeY4ewyMKfe3BDHt1KH68qwo/QJDSr9zg5re/SNVERiRT
	sgNHwsYC7HDpmYIvo1kghEUoo44p32KcTilGRaL0Pm212oYgMvTno00AkiGC07P+74wqJ6CfIKa
	d5Fy4QvpWZVcet2gUVY3yHWfoJLwA3Y+Im5qJMuxCt4cUE/ECuuJz54+czN093g7UQJNaDwtwGS
	Nzu7NwThZwbYqDTtbaVGoqAmVWhQbIusIGDA5idDOEBmkhLJXJB5PqANcEupz9
X-Received: by 2002:a17:903:1d0:b0:2b0:6a22:5165 with SMTP id d9443c01a7336-2b0cdc0467cmr82565005ad.7.1774726373346;
        Sat, 28 Mar 2026 12:32:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b242626fbesm3565615ad.17.2026.03.28.12.32.52
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Mar 2026 12:32:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899edf01747so85427196d6.2
        for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 12:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774726372; x=1775331172; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hbJ9V04+ZWZ+5XnMMOCYY9ggTWoNFS1ISmhMxK+ydVw=;
        b=E9fLWGUxhzcKuRW66MDyYXybE+o4o/35XRQGGQ9S/waABngcH3gRYtKFEvrK7I1cEI
         BLvFUaS+m1C6ceKH06JtTwe4ybGzN5ZAKNSp84mCVE9W0YEKi2eeAI5Bq+v2vpBBgNw6
         7M8d6YsouFFw9fNhDuTkEJvHmbcniB88zUR78=
X-Forwarded-Encrypted: i=1; AJvYcCWIi03rocShYmQxJTxx9+swIeFKVHj33DilPtWl1np4vwmYMLHMRPloHBhpMnN0lvTBGSZGa3VvlUY=@lists.linux.dev
X-Received: by 2002:ad4:5aab:0:b0:89f:1423:999d with SMTP id 6a1803df08f44-89f1423b19cmr40054256d6.43.1774726371933;
        Sat, 28 Mar 2026 12:32:51 -0700 (PDT)
X-Received: by 2002:ad4:5aab:0:b0:89f:1423:999d with SMTP id 6a1803df08f44-89f1423b19cmr40053896d6.43.1774726371484;
        Sat, 28 Mar 2026 12:32:51 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ed02364edsm22958286d6.46.2026.03.28.12.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 12:32:50 -0700 (PDT)
Message-ID: <83c07d92-ca7e-4569-9358-bda3bd774a22@broadcom.com>
Date: Sat, 28 Mar 2026 20:32:48 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] brcmfmac: validate bsscfg indices in IF events
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: johannes.berg@intel.com, chi-hsien.lin@infineon.com,
 chung-hsien.hsu@infineon.com, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel@vger.kernel.org, kees@kernel.org
References: <20260323074551.93530-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20260323074551.93530-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 23/03/2026 08:45, Pengpeng Hou wrote:
> brcmf_fweh_handle_if_event() validates the firmware-provided interface
> index before it touches drvr->iflist[], but it still uses the raw
> bsscfgidx field as an array index without a matching range check.
> 
> Reject IF events whose bsscfg index does not fit in drvr->iflist[]
> before indexing the interface array.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c | 5 +++++
>   1 file changed, 5 insertions(+)
