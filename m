Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5815C2FD1CE
	for <brcm80211@lists.linux.dev>; Mon, 13 Oct 2025 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760347570; cv=none; b=DwXgUzMKwYwYIFr7FnUxsJkMIGjPWv4BgCpH9mcYGyahzq6j0M+TNXXEnykWumYQ5yAD8gDYgkwJFNDVz/VXNRoSjIx+Uzp+I5oXkEhc0ZUy3cCMIGPdTSUmDRwrYiHIifmJcbW6rkEojDHi7CJ2xdkEthmJi2q8NvDsH9rcpJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760347570; c=relaxed/simple;
	bh=382/roRFqkOwJECYdfbCfLLziMSqs9guVhAUjCFzQjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q63RtMcPjCq3UmATLQKwlzD1fszHMTCZOo2cq/4wn8p6Xp5FV3B/KjtEfSyeYTDi5qFHJTrvOpSeK43M+r+qSLyRTPCugqjBr028V/S6GsJLCuShu5EJ1NdR8CZYctmOuFrrKyTK5twYxBqAdjJwMSJE6JynxfUA22ZgNboaQXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hJNl8kC8; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hJNl8kC8"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-b6271ea39f4so2663385a12.3
        for <brcm80211@lists.linux.dev>; Mon, 13 Oct 2025 02:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760347566; x=1760952366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+WyV8pCzt+hpRaPvT/xOVlqiGN48UdZ8Ff3wBlnLB4=;
        b=OGmJz/mEH+ebDH+iho2q7ZyZQPR74R1l8/u6wUTCd+3mtO+bYrTcQ8CIHW3JAZqvqu
         IfAnhxUHRQSSfJuZaRHQXLU4JoQ87DXypJj3OLxVnSq9p/3gd0AH+rbcPq/BidgTyjLV
         wDPDLHzH6gKwepfxLBs8ckAh7jTjo7wV2okoAnkEot5nzYtMPgIm9CVq0YeN9Qkrh3LY
         KMtAjIxls+hH43NVc66x3yNXuO4Zfk+8Z06RSJdVDJcD2CWiu70AMT/FsNfz5DUzK2kx
         Oboe9I3WjIVQ3Irgl8lgFGQ4K+PvBnsPwK94vom3iLmH64OUHJl1U8OqxK8liSc54L7Q
         3sHg==
X-Forwarded-Encrypted: i=1; AJvYcCUMwKUO4x89VyuDZcWfkdBQOeRo39hEm/NHEhv+t26QdmRvPuKxgohh5Zx4gGoSc+5X22BiA3PJjfU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKO1Po0UDpT5ReB5RBw/9nCGN4Ugr9MqstseX9k6H7HdHuGUy9
	jCOCRJz4Xmzj2zXt7tjNeF6LWM5084ltkbudBxhMyx4x8CZOLJsktiWcHiRBqPca/klgEnfE/I3
	XscpjGcnQQoNvzgQH83GuPY5niFUmxJgg2YtxY/qVq4qay+XvPjQG9qRpWDyC3ukoXRBcHHwieY
	+J9T0hFzAhfQEHKZySG0i+huNDQre6QqHHqanW85Kf0Q6iBwXs7aKgC/MNsRjvVeb6YrJkeMrqi
	6HAIoOCPWol4GoDwyUf4A==
X-Gm-Gg: ASbGnctkNI8YF409P/sRDxxNexLZu4nVYWxJJa0x0deVNKurE+QPU/gjLPUoBCMMC8+
	h1YM9/l1Yu7a8lzphTfhjsDq/Y82DeR0PAQL7dsHiQgnvONznF6m3Ru5TyfWAG6LDeeYmI0zeDm
	Spe2QEIF3u30ER9yTwHe7x2qBIU8OC32a5DVH8VRo0IjBu1jfXdNaxwJ+H0M0ehGGnTJEHO4o3V
	OD24Yc8ot9yVr4KOPvrSUrJuT3IIvPYADfskNvpo27K/rYjPVsb6j/dtsLqrxDXqTn+LD//5Ub5
	26TxFnbkNBLBkEkR4Oqfk0+tBtX/wdY9/XzFp6C6SMvR1YHoL04tpww+hSZilvPFis5MLz5GjEd
	/2g/7t9gi9dlPA6evjN0oHfgxtvlws03BMBg8JtY/mQJR19qplwfS5cCPGDRXVbwx90L4fltIEe
	/B4qA=
X-Google-Smtp-Source: AGHT+IECIqtCUmnkUCIG0HPuHI5BOsRMuAQIvKoiviXWi+zBDMZ3/n1mey+wpO9T3od0skLTIFXYQi577+ZS
X-Received: by 2002:a17:903:38cf:b0:267:87be:505e with SMTP id d9443c01a7336-2902737c68bmr223395695ad.23.1760347566380;
        Mon, 13 Oct 2025 02:26:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-15.dlp.protect.broadcom.com. [144.49.247.15])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-29034df7392sm10624515ad.6.2025.10.13.02.26.05
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Oct 2025 02:26:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-78eb8a9d229so200242266d6.1
        for <brcm80211@lists.linux.dev>; Mon, 13 Oct 2025 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760347565; x=1760952365; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a+WyV8pCzt+hpRaPvT/xOVlqiGN48UdZ8Ff3wBlnLB4=;
        b=hJNl8kC8L4bWlNwvR/GEpfgQAprHQDSgOGNtFjCra60/j5j15GFfi2VDz7rQ1PPVCG
         2czpxWBMCNjrOGpvt01T49PLGsb6d4D5di6J5zPBwgA7luFVups11MCord/0xAVGcutu
         EdUV1jIwsLIz3rk5Gm91NNx9a/mvsdkS7Tc9E=
X-Forwarded-Encrypted: i=1; AJvYcCVRjFuMKsmiki8PNXCyKsRmg2NDl0KfTLxEfCSFK/0Filopla1I485gdzM+0P9+s1S06cB/JhSw4+E=@lists.linux.dev
X-Received: by 2002:ad4:5ccc:0:b0:79c:f4b0:6813 with SMTP id 6a1803df08f44-87b21065472mr297538796d6.21.1760347565048;
        Mon, 13 Oct 2025 02:26:05 -0700 (PDT)
X-Received: by 2002:ad4:5ccc:0:b0:79c:f4b0:6813 with SMTP id 6a1803df08f44-87b21065472mr297538586d6.21.1760347564680;
        Mon, 13 Oct 2025 02:26:04 -0700 (PDT)
Received: from [10.176.2.222] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc3479578sm68700836d6.19.2025.10.13.02.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 02:26:04 -0700 (PDT)
Message-ID: <4d24f3ed-0b7d-45cb-9dfc-b8b5e0b37fd2@broadcom.com>
Date: Mon, 13 Oct 2025 11:26:01 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next] wifi: brcmfmac: fix crash while sending
 Action Frames in standalone AP Mode
To: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
Cc: brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 chris@streetlogic.pro, linux-wireless@vger.kernel.org, richard@govivid.ai,
 s311332@gmail.com, wahrenst@gmx.net, wlan-kernel-dev-list@infineon.com,
 johannes@sipsolutions.net
References: <9a0849d8-befd-4fca-9d5d-a24520ccfa26@broadcom.com>
 <20251009073928.6803-1-gokulkumar.sivakumar@infineon.com>
 <08368241-6b89-49e5-81cf-8e7874c91696@broadcom.com>
 <aOyqOnKEnkNqfg9u@ISCN5CG14747PP.infineon.com>
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
In-Reply-To: <aOyqOnKEnkNqfg9u@ISCN5CG14747PP.infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/13/2025 9:28 AM, Gokul Sivakumar wrote:
>>> -     reinit_completion(&p2p->send_af_done);
>>> +     init_completion(&p2p->send_af_done);
>> I think we should not do this here. It used to be init_completion() here
>> but the kernel API changed introducing the reinit_completion() to make
>> explicit distinction between init and reinit. So I would suggest to do
>> the init_completion() in brcmf_p2p_attach() which is always invoked and
>> leave the reinit_completion() here.
> That works too. Will create an updated v2 patch after making this change
> and submit it for the wireless tree instead of wireless-next.

Great.

Thanks,
Arend
