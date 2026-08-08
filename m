Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC20346ADA
	for <brcm80211@lists.linux.dev>; Sat,  8 Aug 2026 05:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786166430; cv=none; b=d/1dYoCvK/+U0iJxFrN12KIVC49uj3zh1Bu6fth2pGqZoKpwV7qVkY+nc7Si5DiMt5xKj8x7AN/tKjEOVufzOWHp42haqeUul69crAYm+JhNdFgoZHVJxgeO2GbMbyzPho0BQ/cP/K3MR16FCpbpMBSXvoa3QtiNMMkAVmMeH98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786166430; c=relaxed/simple;
	bh=nU/2OOvqLDucf42vJ9zbZVAYbRRlmeeEpprDjXmH3a4=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=INVZmEMQskzL+CKz7Vvd4gU7tTpZ0WgJTV6K92cK6ePwvQyXlMMeDF33ge5i3G26IojSmDP/Kuv3dKhJlBtqEBDQscK3gzfeh/jGP/2OymMFuBX7OMnjMvdq6knXkkqCPC9jjVgxNVT/de5ZXyGpdnnMz36GGs+mzHs8fmMhR7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=c7I/HjHF; arc=none smtp.client-ip=209.85.210.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="c7I/HjHF"
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so186489b3a.2
        for <brcm80211@lists.linux.dev>; Fri, 07 Aug 2026 22:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786166429; x=1786771229;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFUU6ozWORWiiM1uNeCkxuEsbC3KYm7Xvn+yMHJJFRY=;
        b=JSvDoJN0AeosIkGfWH9rtd1h9ce6Vxn7pIq+zGc/Uie+nB6w4Do/ilAIHytkteoU1k
         YU2oTS/1Z2Hkv8oXBq9LFRq1OBIztSl3Ta0GpVpgU87xufPu5Fertn+0EKK9umcABDRQ
         y9VNkRvvlhcrewAfqIHUQnc8BpV8GnhCZZrs3ekrJL6HnYGgd3W3dhKRbzrLrTbBVOOe
         7WBlwOgA6YiapiXl/QupagbXRvLdAvsFb2wLAiYzubJBzNCkbNG+EGrsUcymk/87791d
         irFSm/qG65vkncx3RLxROpflk6xcFztextUBSIoFc550HqxYLGElp5ZbM+u3EH/c8e+O
         xmGw==
X-Forwarded-Encrypted: i=1; AHgh+RqXf4GYKa+sB6QABoPCH2CJc+VWWKCgXuKATCI6CshsSvlTxHduHHX7Jjr3WB5V78A0Kl9PyOkyzik=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWvWJiMJmgicwrj8+Oj8Z4lU8s15yMqSpNDRHUR3vhBW8WB501
	gV4nbskcXWTeAhGcwDqoWpPPf4UGt7qzXl8VKZbSDgQf7aS2LfVTZIUxOn/JeR1A31GeW2svejP
	lTpJkYXCWaW2b6P6t8m5i4SHHe8h4EF33aYspfTOR7jb5hqUsgvTJCmCIHuM4R7bTGdak0dRgww
	3nVLdCkDe+9xP7gTHiOGkKjWwfeRCF85viCMdjjmLJ4OiQV3+dxsAsiJO8H9Ocn24nG5wPA//ZI
	7a3U+srkv9DCBse0DFt4Q==
X-Gm-Gg: AR+sD12fkCIYcMntDwZKW8S4ngJafaIsq1Y/w+RS5NMQ/kdHIFbw8nycTrZbRFHPgyH
	ZsDvnstKA1MgNZc306kDF/pv/Zjkzo4gpK5qkliMuqCj09FAJPoGD0Dj0bLm9nmCZFXcd6dcb0h
	1R4n7EJ/N+FEfZxLBmgiO0KgBDUzm1TNuihgeovwLxReroNKcvteah3NfqAAlgT5RkFfqdYzyMb
	k3c/OsIALzNlyUpZds7Xe+1GIIUI953a+A4/bhRVZNqDdW6DrzKQ0JWBqP6ETPbRnxZGEMgfyTR
	bpsztOJ9j16oUlYEvXW6rUkL4oZ6SDgyMqcJsXEA1Bm4jeVBZg1NmyNBs9+cigWpCYCCOCAEnyX
	Ka3/AhZyzw+zPX/bRiN9eoLN+mctdj3mzaJ424KJlktTPqaoc1W5V/YxjJIwYDj58HWQyAZJf9j
	bvP00mdAId/LC6H8CZO9Q3tkaSlzvWsw7FLNlJ
X-Received: by 2002:a05:6a00:3cc6:b0:846:f502:4cd5 with SMTP id d2e1a72fcca58-84f2e029baemr30810233b3a.20.1786166428697;
        Fri, 07 Aug 2026 22:20:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-84f5a461ac5sm1001977b3a.7.2026.08.07.22.20.26
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Aug 2026 22:20:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso3848445ad.0
        for <brcm80211@lists.linux.dev>; Fri, 07 Aug 2026 22:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786166425; x=1786771225; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aFUU6ozWORWiiM1uNeCkxuEsbC3KYm7Xvn+yMHJJFRY=;
        b=c7I/HjHFN94YwObHY4DDZaEYA0MaiP2GKiVcBqImsFZ2stBNcp0jTOraoKVCrPzA5z
         c7Oohg5ZWyqug2yPg/AWs0rvkZE63sqMLY9JjVccCpXyzSFNeawjroh3Lwr8jjQjVS5r
         rYEbxQnO39/dpA4xNrJBlYGw0j66/BqR9r1oU=
X-Forwarded-Encrypted: i=1; AHgh+RrokTM6MFIjgcPUU7XyGWjaam9+srh0x1TqL/Qd1wedhFHNzPDaX/xXmBUh4o8z36Q7xdevhhGNBN0=@lists.linux.dev
X-Received: by 2002:a17:902:ecc1:b0:2c9:fb11:1bf4 with SMTP id d9443c01a7336-2d0ca7b5436mr286487755ad.7.1786166425357;
        Fri, 07 Aug 2026 22:20:25 -0700 (PDT)
X-Received: by 2002:a17:902:ecc1:b0:2c9:fb11:1bf4 with SMTP id d9443c01a7336-2d0ca7b5436mr286487355ad.7.1786166424861;
        Fri, 07 Aug 2026 22:20:24 -0700 (PDT)
Received: from [10.229.40.14] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde2e6sm13972699eec.21.2026.08.07.22.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 22:20:23 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Bogdan Nicolae <bogdan.nicolae@gmail.com>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>, Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
Date: Sat, 08 Aug 2026 07:20:19 +0200
Message-ID: <19fdfd09e38.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <CA+ORkNSS1dOdUK51B0Q1r2Htc5NpP-=EmE4FO6=4rX5CUU_FpA@mail.gmail.com>
References: <20260729053408.13715-1-bogdan.nicolae@gmail.com>
 <20260802083905.3819981-8-arend.vanspriel@broadcom.com>
 <CA+ORkNSS1dOdUK51B0Q1r2Htc5NpP-=EmE4FO6=4rX5CUU_FpA@mail.gmail.com>
User-Agent: AquaMail/2.6.0 (build: 200600043)
Subject: Re: [PATCH] wifi: brcmfmac: configure SAE PWE method for external SAE AP
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 8 augustus 2026 02:00:22 schreef Bogdan Nicolae <bogdan.nicolae@gmail.com>:

> Gokul (representing Infineon) promised he would send a patch a while back.
> This would be a preferred solution as it comes directly from the vendor.
> But it also takes time. I can send a revised patch next week.

Yeah. With Johannes being on vacation I say we can give Infineon bit more 
time to provide their patch.

Regards,
Arend



