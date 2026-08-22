Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0E23382F7
	for <brcm80211@lists.linux.dev>; Sat, 22 Aug 2026 18:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787423220; cv=none; b=JFHyBstBCmXmu1lp7fWcuKlcTZ2OQk8j6SUSLshyMRyqcwiZEUdmP05fxPc11v1cp7IMrugxa5ldTnVc8OX4ZlIcA0dq+ES3BG+ya4k/B+9Ijgs8s3Iuh4XQ2X4iRowvQ59UDM3K0Z0lQAbU59US9os79deKrkXYQKXGMVL6x5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787423220; c=relaxed/simple;
	bh=uq3A1sNVYEdKpA7gxbETBfyN1KpDSfAsdal7tIBTVjE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BFy5pAims3O4uYHIryxPCELr993L2B7BOXiQENT3j6eCaCwyxxPUHRPg2VciGTkukzP7NyRatFFPZ1wugII3gQzvhG4QtWet4WWCp4WawfbdyrGK6zObK0qblwqcuCH6VtsV5zRv2j/btBwajjOWm8jRYhrQtt1yraPlYX51FBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DLiqjeFb; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DLiqjeFb"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-38e347638adso1852161a91.0
        for <brcm80211@lists.linux.dev>; Sat, 22 Aug 2026 11:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787423218; x=1788028018;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ayvjUqnkGC3HPVARpVFh4ZXeLs68IbUz5B1oV86llgY=;
        b=qIWIP3OE5odBVjshrh/7j2kUb72DrVS2tcqY3yB4uLFB4/5e+UBzYcQqUbz50dYemO
         VpaSJldsxk0xs4/1SW7DaesK3loXEmpNE1vQ7b6NA2/Ew928HPgzMOUNgDN17sfi3V7h
         xHbueJQv1I8oLpKt8s+2YLds270/4dYPeBPppdYei2Xsv1LjTomo5Px9mKjHuSP9JgCW
         QR95kykrGGOYCD3x1RkMhQFSG1RuY7G2oIWTB9t6jzK88ktoNgo479UEfEbGiCBXpodQ
         GpeBJLQrAOghcsuEuFZdmqzH6ImvDNFEzU+GBmHS6t1iHeSi82llLlMvE21uz3fS9RJo
         sW1w==
X-Forwarded-Encrypted: i=1; AHgh+RpZ0EgGP8x9FOkIG9zo4zNRB08itJQrCXvafoIqoHXRqFMvElN+l7UB6DSIP8ZIjqO28857S5m2UGA=@lists.linux.dev
X-Gm-Message-State: AFuF++lJLNPm4fPf4zYY6djdBhq0fh5+6z6OdHItMezb7eUdGYQWs+5b
	Li/jpxLhu0nQ9r5C2iwmfNgwDANln5hDo565sSDtllUbfwVRH9SHqLwqqVOGGT0nta4+XfXbCCl
	z5d93x5ja/AFGKsk2VuRSU70dxsX49EoKntAhZGklGXwM43+Ucs+IcuC1s560NYZ3DFABiOgDca
	+iDtcI38xurPr4yiUqrDuLpboozGYpGh+FNswbf/ZxisoHWpKHmnwrGMqnnNoBu3tcKY+cfSceT
	xrT9Ae5RxnWyCY3Fp0=
X-Gm-Gg: AR+sD131jrrmCx5tNPFd/xIzq2bXxNIQgC5e0HXvBI/K4JyGi8wN/U0j6Qa6kX4sPGd
	DVhqiqPGYCjgpt6oSwgJeAXYyzCcAwlxx19Q+UBWybYTr7mfspLeZYR+Rfw+FtSy2wFZZiGGdhf
	E1CmDiI0H9japU8hpa5o+R/VrFuiPrCcW0mE5edL1XfWM/RBr0REMYZxMIrvTqzVTYQOB3Przzc
	4tH6vjDS+QnD+Gz46XsjjvpwMGDvqBesCEt/vcm5enirL8EyeamnZ5wB1rVdWcCyxcip5h8/Cgh
	tBczf0XKf1D1gqKvulBDRm9Oa+spswenEkuZ3GqZ9J6dki3BTJzsYjXgCclYBJy1j6JYTyt/ELO
	X+DWS2T/oTambkpDF6XL13Sgo/LaljrTl+vbp/stY48v0ZPXFpxMQ1MafsdL/0XgE0ymdNANbbE
	xiuVwkGr6P9eYlrL7OP5qKbCB7D+pS83UFbPZXQy0=
X-Received: by 2002:a17:90b:3b48:b0:393:1cf4:d972 with SMTP id 98e67ed59e1d1-395dee55f7emr10961958a91.3.1787423218201;
        Sat, 22 Aug 2026 11:26:58 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-395e49a7664sm1393219a91.6.2026.08.22.11.26.57
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Aug 2026 11:26:58 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d55d8cd938so39294695ad.1
        for <brcm80211@lists.linux.dev>; Sat, 22 Aug 2026 11:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787423216; x=1788028016; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ayvjUqnkGC3HPVARpVFh4ZXeLs68IbUz5B1oV86llgY=;
        b=DLiqjeFbnwfCdZyx27ElgZAeaemCfR+CvxUN1gJ7jQmVQVccWAy0WY/sbD3N2QA0Kj
         gZ8vN2NxhHJO+HiZ495Y1lNopHf8GPUTIJURNQZ5rC//nmEMBDXw7XL8GYTHu4iId/OX
         TQ19O/wSW6hyNlGCXOzdgdJEQjmlwFuAB0STc=
X-Forwarded-Encrypted: i=1; AHgh+RofR9T9GH3iqRCuI2X3cwSsMwjWlPqCVneM4KzC4wGfDm5H3xP/mNnMMEUVZaMbMNadfAWv1c7mIM0=@lists.linux.dev
X-Received: by 2002:a17:902:d552:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2d670b85ea7mr143130775ad.5.1787423216453;
        Sat, 22 Aug 2026 11:26:56 -0700 (PDT)
X-Received: by 2002:a17:902:d552:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2d670b85ea7mr143130315ad.5.1787423216011;
        Sat, 22 Aug 2026 11:26:56 -0700 (PDT)
Received: from [10.229.42.78] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923490bsm14091904eec.26.2026.08.22.11.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2026 11:26:55 -0700 (PDT)
Message-ID: <cbb4b486-c7db-4687-a08c-1b1486583d32@broadcom.com>
Date: Sat, 22 Aug 2026 20:26:52 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] brcmfmac: add FT/OKC roaming offload support
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jason Huang <Jason.Huang2@infineon.com>, linux-wireless@vger.kernel.org
Cc: johannes.berg@intel.com, johannes@sipsolutions.net,
 hsin-hung.li@cypress.com, linux-kernel@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 wlan-kernel-dev-list@infineon.com, jeff.johnson@oss.qualcomm.com,
 Carella Chen <carella.chen@infineon.com>
References: <20260821-upstream-wireless-next-main-jason-11r-support-v1-v5-0-eeab4fda0f31@infineon.com>
 <71261493-e974-4f5c-a453-b4c2e449baf5@broadcom.com>
Content-Language: en-US
In-Reply-To: <71261493-e974-4f5c-a453-b4c2e449baf5@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 22/08/2026 20:24, Arend van Spriel wrote:
> On 21/08/2026 09:56, Jason Huang wrote:
>> From: Carella Chen <carella.chen@infineon.com>
>>
>> This series adds the cfg80211/nl80211 and brcmfmac pieces needed to
>> support firmware-assisted FT/OKC roaming offload.
>>
>> Patch 1 adds an nl80211 extended feature bit so drivers can advertise
>> roaming PMK programming support without claiming full 802.1X 4-way
>> handshake offload. The brcmfmac patches then detect firmware FBT/OKC
>> capabilities, keep roaming-offload connections in a firmware-supplicant
>> profile state, program PMK material for FT/OKC roaming, report port
>> authorization after offloaded roaming, and advertise the new capability
>> when firmware support is present.
>>
>> Changes in v5:
>> - Reworked nl80211_set_pmk() to avoid the 80-column checkpatch warning
>>    on the 4-way handshake extended-feature check.
>> - Added kernel-doc for the brcmfmac OKC profile state added by the PMK
>>    programming patch.
>> - Normalized Assisted-by trailers to the checkpatch-accepted
>>    AGENT_NAME:MODEL_VERSION format.
>> - Added Johannes and the wireless/brcm80211 lists to the cover letter
>>    Cc list for the nl80211 and brcmfmac changes.
> 
> Hi Jason,
> 
> Thanks for the follow-up, but looks like it happened again. Missing 
> patch 5/5 as happened with v3 series.
I do have other comment(s) for v5 series, but feel free to send the 
missing patch so I can review that in one go.

Regards,
Arend
