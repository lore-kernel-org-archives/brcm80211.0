Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937877;
	b=JW6BZxMgATxoSPGpTQJbQzZ9OQJmta3cWOG+O8lT6LBSiTYP6CUvqmQACdAaNHqoZT3K
	 YxykWIUNffta/SXt3P4LqvFUNIGx4ispD/+DWv/E05bD6qtuCRI5iPp/cAgIRJ6LtxUFy
	 o0RVplbwS3etnfrC7VKSWWh696lGz/+miNRZ7AzQNKaB3FHeM4gRrbVkUqdzuG8BgznKS
	 2ckxptU7md+9LjGgyYyFCOGfj1rWLUQNxx2jYWJJiNfhumLXPxQVRPTgtCS4PuUNxUtBF
	 hVx1+eDOtrGS+xV3mykeIJbgVk9ZBfnndEor5BUgwWEAONZaWSpbe5Apy1pPMr1pIYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937877;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Content-Transfer-Encoding:
	 From:Mime-Version:Subject:Date:Message-Id:References:Cc:In-Reply-To:
	 To:X-Mailer;
	bh=NyJHQVZlR7Bg3YiZaxy69rT5ur8XKMGpnCK8SptUJGI=;
	b=q7/Qrm+6Hx25aHZ8Qh6QWQIXfovJN477WlyM7kdZQW47rxYKDMDUXzUJ6URwXHhOvNwV
	 0vYfp6QvwifBgqvhvx9cFThkEYf0mCqu95//ThwyxyvSHBfXC5NGjRHshMCEjLVDyIL/k
	 0iz7p1jrUEXDUBY2wW9KWe/aiB89zkdEK1v9/BwXagZ4Rug3LEilT2f9gZZHWhH1/RPK1
	 j7mP8ti9l6RcT+u836/8AM4VqzG1uhGxbeKxHSiBm9KTikPa6jgQJPUCIvMH2gTtKFRBb
	 B48a5tUPK7sfpqHZZRtlK0r9P8s6KQSnB87TNkqDx8vIb1kqAPqjozrLnEpk1OzD6iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d+e9J44S;
	arc=none smtp.remote-ip=95.215.58.63
Received: from mta1.migadu.com (out-63.mta1.migadu.com [95.215.58.63])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6805606A330
	for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 17:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6805606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d+e9J44S
X-Envelope-To: brcm80211@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=1TRKjL14fn5CF/4hY/IYYIPiXO27UBjCdYR27fESFKQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794937875; v=1; x=1795542675;
 b=d+e9J44SbSOt2/rmDr9kIMThfaaCgMbt45//LLqd6kjcmzQDoXRaNJ/gSxmmpEKzPfsj8KdA
 Y4zMmsQNhdU3FCsfh9Js7KGPHdrvDIFtfRzaFN5EZAYYgMa9Y9cxKSdbjomroR0wgNEz06lHrTF
 saDfVBCIBRdNtHm14ktzLuls=
X-Envelope-To: brcm80211@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id 4153e0931e20c31d;
	Tue, 17 Nov 2026 17:51:14 +0000
X-Mizu-Trace-ID: 4153e0931e20c31d
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Aditya Garg <aditya.garg@linux.dev>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] wifi: brcmfmac: disable TX beamforming on BCM4364
Date: Tue, 17 Nov 2026 23:20:56 +0530
Message-Id: <2FBC4AA9-16FE-4710-B43D-9004B0B17DFA@linux.dev>
References: <20261116203719.281605-2-arend.vanspriel@broadcom.com>
Cc: Andre Eikmeyer <dev@deq.rocks>, arend.vanspriel@broadcom.com,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 Yossef Osman <Yossef.Osman@proton.me>
In-Reply-To: <20261116203719.281605-2-arend.vanspriel@broadcom.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
X-Mailer: iPad Mail (24B119)



> On 17 Nov 2026, at 2:07=E2=80=AFAM, Arend van Spriel <arend.vanspriel@broa=
dcom.com> wrote:
>=20
> =EF=BB=BFOn Wed, 4 Nov 2026 16:16:23 +0100, Andre Eikmeyer <dev@deq.rocks>=
 wrote:
>> With "txbf" enabled, the BCM4364 firmware (9.30.514.0.32.5.94, as shipped=

>> by Apple for the MacBookPro15,1) transmits a single beamformed spatial
>> stream (nrate VHT MCS9 NSS1 TXBF) towards a two stream AP. With "txbf"
>> cleared it picks two streams (VHT MCS9 NSS2) on its own. The firmware
>> enables "txbf" by default, so the driver has to clear it.
>>=20
>> [...]
>>=20
>> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
>> Tested-by: Aditya Garg <aditya.garg@linux.dev>
>> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
>=20
> [...]
>=20
>> @@ -450,8 +451,12 @@ int brcmf_c_preinit_dcmds(struct brcmf_if *ifp)
>>        goto done;
>>    }
>>=20
>> -    /* Enable tx beamforming, errors can be ignored (not supported) */
>> -    (void)brcmf_fil_iovar_int_set(ifp, "txbf", 1);
>> +    /* Enable tx beamforming, errors can be ignored (not supported).
>> +     * BCM4364 firmware enables it by default and then transmits a singl=
e
>> +     * beamformed stream instead of two, halving its uplink throughput.
>> +     */
>> +    (void)brcmf_fil_iovar_int_set(ifp, "txbf",
>> +                      drvr->bus_if->chip !=3D BRCM_CC_4364_CHIP_ID);
>> done:
>>    return err;
>> }
>=20
> The chip ID check has the same problem as in the ARP/ND offload patch [1]:=

> the issue is described as specific to the firmware shipped by Apple
> (9.30.514.0.32.5.94), but the quirk applies to every BCM4364. Please
> restrict it as suggested there.
>=20
> Also, the comment says "Enable tx beamforming" while the code now
> conditionally disables it. Please make the code self-explanatory, e.g. a
> local variable or an explicit if (chip =3D=3D BRCM_CC_4364_CHIP_ID) with t=
he
> txbf value spelled out, instead of passing a bool expression as the
> iovar value.
>=20
> Minor: typo "refression" in the commit message, and the subject lacks
> the target tree (wireless-next) which wifibot flagged.
>=20
> Since this is a throughput quirk (not a fix) I would also like to know
> whether TX beamforming is functional at all on the BCM4364 or just
> mis-selected by rate control, so the commit message can state the actual
> root cause.

Unrelated but Airdrop conversation seems to have been stalled :(.=
